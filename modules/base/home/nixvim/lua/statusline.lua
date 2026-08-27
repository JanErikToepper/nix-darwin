local statusline_state = {}

local function calculate_filepath()
	local filepath = vim.fn.expand("%:h") .. "/"
	local filename = vim.fn.expand("%:t")

	local filepath_table = {}

	for fragment in filepath:gmatch("(.-)/") do
		if not (fragment == "") then
			table.insert(filepath_table, fragment)
		end
	end

	local formatted_filepath = ""
	local count = 0

	for i = #filepath_table, 1, -1 do
		if count > 2 then
			break
		end

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

function _G.update_statusline()
	system_cmd("git rev-parse --abbrev-ref HEAD", function(branch)
		statusline_state["branch"] = branch

		vim_cmd("redrawstatus!")
	end)

	system_cmd("git log -1 --pretty=%B HEAD", function(commit)
		statusline_state["commit"] = commit

		vim_cmd("redrawstatus!")
	end)

	statusline_state["filepath"] = calculate_filepath()
end

function _G.get_branch_name()
	local branch = statusline_state["branch"]
	local commit = statusline_state["commit"]

	if branch then
		return string.format("[%s] | %s", branch, commit or "-")
	else
		return ""
	end
end

function _G.get_filepath()
	return statusline_state["filepath"]
end

vim.opt.statusline = "%{%v:lua.get_branch_name()%}  %=  %{%v:lua.get_filepath()%}"
