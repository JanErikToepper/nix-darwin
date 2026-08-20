function _G.switch_branch()
	local is_branch_dirty = system_cmd("git status --porcelain") ~= ""

	if is_branch_dirty then
		vim.notify("Branch is dirty", "warn", { title = "Neogit" })

		return
	end

	require("telescope.builtin").git_branches()
end

function _G.continue_rebase()
	local has_open_conflicts = system_cmd("git grep '>>>>>>>'") ~= ""

	if has_open_conflicts then
		vim.notify("Open merge conflicts", "warn", { title = "Neogit" })

		return
	end

	system_cmd("git add --all")

	require("neogit").action("rebase", "continue")()
end
