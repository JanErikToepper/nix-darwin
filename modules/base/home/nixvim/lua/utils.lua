function _G.vim_cmd(command)
	vim.cmd(string.format('silent execute "!%s" | redrawstatus!', command))
end

function _G.system_cmd(command)
	local result_buffer = io.popen(command)

	if not result_buffer then
		return
	end

	local result = result_buffer:read()

	result_buffer:close()

	return result
end

function _G.format()
	require("conform").format({
		async = true,
		lsp_format = "fallback",
	})

	pcall(function()
		vim_cmd("e")
	end)
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
