function _G.vim_cmd(command)
	vim.cmd(string.format('silent execute "!%s" | redrawstatus!', command))
end

function _G.format()
	vim_cmd("e")

	require("conform").format({
		async = true,
		lsp_format = "fallback",
	})
end

local function register_format_autocmd()
	local bufnr = vim.api.nvim_get_current_buf()

	vim.api.nvim_create_autocmd("TextChanged", {
		buffer = bufnr,
		once = true,
		callback = format,
	})
end

function _G.apply_code_action(title)
	register_format_autocmd()

	local found_action = false

	vim.lsp.buf.code_action({
		apply = true,
		filter = function(command)
			if found_action then
				return false
			end

			found_action = string.match(command.title, title)

			return found_action
		end,
	})
end
