function _G.stage(cb)
	system_cmd("git add --all", cb)
end

local function switch_branch(branch, create)
	local formatted_branch = string.gsub(branch, "origin%/", "")

	system_cmd("git switch " .. (create and "-c " or "") .. formatted_branch, function()
		fetch_git_info()
	end)
end

local function handle_telescope_branch_pick(bufnr)
	local selection = require("telescope.actions.state").get_selected_entry()
	local line = require("telescope.actions.state").get_current_line()

	if not (selection or line) then
		return
	end

	local branch = selection and selection.value or line

	require("telescope.actions").close(bufnr)

	switch_branch(branch, line)
end

function _G.safe_switch_branch(branch)
	system_cmd("git status --porcelain", function(is_branch_dirty)
		if is_branch_dirty then
			vim.notify("Branch is dirty", "warn", { title = "Neogit" })

			return
		end

		if branch then
			switch_branch(branch)

			return
		end

		require("telescope.builtin").git_branches({
			attach_mappings = function(_, map)
				map({ "i", "n" }, "<cr>", handle_telescope_branch_pick)
				map({ "i", "n" }, "<c-a>", handle_telescope_branch_pick)

				return true
			end,
		})
	end)
end

function _G.commit()
	stage(function()
		create_autocmd({ "User" }, fetch_git_info, "NeogitCommitComplete")

		require("neogit").action("commit", "commit")()
	end)
end

function _G.handle_rebase_feedback(status)
	if status == "conflict" then
		vim.notify("Open conflicts", vim.log.levels.WARN, { title = "Neogit" })
	end

	fetch_git_info()
end

function _G.abort_rebase()
	create_autocmd({ "CmdlineLeave" }, function()
		vim.defer_fn(fetch_git_info, 500)
	end)

	require("neogit").action("rebase", "abort")()
end

function _G.continue_rebase()
	system_cmd("git grep '>>>>>>>'", function(has_open_conflicts)
		if has_open_conflicts then
			vim.notify("Open merge conflicts", "warn", { title = "Neogit" })

			return
		end

		stage(require("neogit").action("rebase", "continue"))
	end)
end
