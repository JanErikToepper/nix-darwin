function _G.get_branch_name()
  local branch = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
  local commit = io.popen("git log -1 --pretty=%B HEAD 2>/dev/null")

  if branch then
    local branch_name = branch:read("*l")
    local commit_name = commit:read("*l")

    branch:close()
    commit:close()

    if branch_name then
      return string.format('[%s] | %s', branch_name, commit_name)
    else
      return ""
    end
  end
end

function _G.get_file_path()
  local filepath = vim.fn.expand("%:h") .. "/"
  local filename = vim.fn.expand('%:t')

  local filepath_table = {}
  for fragment in filepath:gmatch("(.-)/") do
    if not (fragment == "") then
      table.insert(filepath_table, fragment)
    end
  end

  local formatted_filepath = ""
  local count = 0
  for i = #filepath_table, 1, -1 do
    if (count > 2) then break end

    formatted_filepath = "/" .. filepath_table[i] .. formatted_filepath
    count = count + 1
  end

  if not (filename == "") then
    return formatted_filepath .. "/" .. filename
  elseif not (formatted_filepath == "") then
    return formatted_filepath .. "/"
  else
    return ""
  end
end

vim.opt.statusline = "%{%v:lua.get_branch_name()%}  %=  %{%v:lua.get_file_path()%}"

function _G.handle_open_buffers()
  local open_buffers = vim.fn.getbufinfo({
    bufloaded = 1,
    buflisted = 1
  })

  if not open_buffers or #open_buffers == 0 then
    return
  end

  table.sort(open_buffers, function(first_open_buffer, second_open_buffer) return first_open_buffer.lastused > second_open_buffer.lastused end)

  local amount_of_buffers_to_keep_open = 10

  for i = amount_of_buffers_to_keep_open, #open_buffers, 1 do
    local buffer_id_to_delete = open_buffers[i].bufnr

    vim.api.nvim_buf_delete(buffer_id_to_delete, { force = true })
  end
end

function _G.cmd(command)
  vim.cmd(string.format('silent execute "!%s" | redrawstatus!', command))
end

function _G.switch_branch()
  local is_branch_dirty = vim.fn.trim(vim.fn.system("git status --porcelain")) ~= ""

  if is_branch_dirty then
    vim.notify("Branch is dirty", "warn", { title = "Neogit" })

    return
  end

  require("telescope.builtin").git_branches()
end

function _G.continue_rebase()
  vim.fn.system({ 'git', 'grep', '--quiet', '<<<<<<<' })

  local has_open_conflicts = vim.v.shell_error == 0

  if has_open_conflicts then
    vim.notify("Open merge conflicts", "warn", { title = "Neogit" })

    return
  end

  cmd('git add --all')

  require("neogit").action("rebase", "continue")()
end

function _G.apply_code_action(title, has_open_end)
  vim.lsp.buf.code_action({
    filter = function(x)
      return string.match(x.title, '^' .. title .. (has_open_end and '' or '$'))
    end,
    apply = true,
  })
end
