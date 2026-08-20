function _G.vim_cmd(command)
	vim.cmd(string.format("silent! %s", command))
end

function _G.system_cmd(command)
	local result_buffer = io.popen(command)

	if not result_buffer then
		return ""
	end

	local result = result_buffer:read()

	result_buffer:close()

	if not result then
		return ""
	end

	return vim.fn.trim(result)
end

function _G.format_and_write(bufnr)
	require("conform").format({
		bufnr = bufnr,
		lsp_format = "fallback",
	}, function()
		vim.api.nvim_buf_call(bufnr, function()
			vim_cmd("noautocmd update")
		end)
	end)
end

local function register_format_autocmd()
	local bufnr = vim.api.nvim_get_current_buf()

	vim.api.nvim_create_autocmd("TextChanged", {
		buf = bufnr,
		once = true,
		callback = function()
			format_and_write(bufnr)
		end,
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
