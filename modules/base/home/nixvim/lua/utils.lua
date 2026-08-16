function _G.vim_cmd(command)
	vim.cmd(string.format('silent execute "!%s" | redrawstatus!', command))
end

function _G.vim_system(command)
	return vim.trim(vim.fn.system(command))
end

function _G.format()
	require("conform").format({
		lsp_format = "fallback",
	})

	vim_cmd("e")
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
