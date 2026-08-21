function _G.log(log, obj)
	local message = log

	if obj then
		message = log .. vim.inspect(obj)
	end

	vim.api.nvim_err_writeln(message)
end
