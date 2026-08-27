function _G.vim_cmd(command)
	vim.cmd(string.format("silent! %s", command))
end

function _G.system_cmd(command, cb)
	local cb = cb or function() end

	local command_table = vim.split(command, " ", { trimempty = true })

	vim.system(command_table, { text = true }, function(output)
		local stdout = vim.trim(output.stdout)

		local formatted_stdout = stdout ~= "" and stdout or nil

		vim.schedule(function()
			cb(formatted_stdout)
		end)
	end)
end

function _G.create_autocmd(event, cb, pattern)
	vim.api.nvim_create_autocmd(event, {
		callback = cb,
		pattern = pattern,
		once = true,
	})
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
