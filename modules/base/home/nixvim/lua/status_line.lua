function _G.get_branch_name()
	local branch = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
	local commit = io.popen("git log -1 --pretty=%B HEAD 2>/dev/null")

	if branch and commit then
		local branch_name = branch:read("*l")
		local commit_name = commit:read("*l")

		branch:close()
		commit:close()

		if branch_name then
			return string.format("[%s] | %s", branch_name, commit_name)
		else
			return ""
		end
	end
end

function _G.get_file_path()
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

vim.opt.statusline = "%{%v:lua.get_branch_name()%}  %=  %{%v:lua.get_file_path()%}"
