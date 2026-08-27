function _G.stage(cb)
	system_cmd("git add --all", cb)
end

local function switch_branch(branch)
	system_cmd("git switch " .. branch, function()
		update_statusline()
	end)
end

local function handle_telescope_branch_pick(bufnr)
	local selection = require("telescope.actions.state").get_selected_entry()

	if not selection then
		return
	end

	local branch = selection.value

	require("telescope.actions").close(bufnr)

	switch_branch(branch)
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

				return true
			end,
		})
	end)
end

function _G.commit()
	stage(function()
		create_autocmd({ "User" }, update_statusline, "NeogitCommitComplete")

		require("neogit").action("commit", "commit")()
	end)
end

function _G.handle_rebase_feedback(status)
	log("status: ", status)
	if status == "ok" then
		vim.notify("Rebase completed", vim.log.levels.INFO, { title = "Neogit" })
	end

	if status == "conflict" then
		vim.notify("Open conflicts", vim.log.levels.WARN, { title = "Neogit" })
	end

	update_statusline()
end

function _G.abort_rebase()
	create_autocmd({ "CmdlineLeave" }, function()
		vim.defer_fn(update_statusline, 500)
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
