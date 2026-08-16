function _G.switch_branch()
	local is_branch_dirty = vim.fn.trim(vim.fn.system("git status --porcelain")) ~= ""

	if is_branch_dirty then
		vim.notify("Branch is dirty", "warn", { title = "Neogit" })

		return
	end

	require("telescope.builtin").git_branches()
end

function _G.continue_rebase()
	vim.fn.system({ "git", "grep", "--quiet", "=======" })

	local has_open_conflicts = vim.v.shell_error == 0

	if has_open_conflicts then
		vim.notify("Open merge conflicts", "warn", { title = "Neogit" })

		return
	end

	vim_cmd("git add --all")

	require("neogit").action("rebase", "continue")()
end
