function _G.vim_cmd(command)
	vim.cmd(string.format("silent! %s", command))
end

function _G.system_cmd(command)
	local result_buffer = io.popen(command)

	if not result_buffer then
		return nil
	end

	local result = result_buffer:read()

	result_buffer:close()

	if not result then
		return nil
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
