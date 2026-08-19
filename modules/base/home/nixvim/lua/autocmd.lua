function _G.handle_buffer_write(bufnr)
	local is_buffer_valid = vim.api.nvim_buf_is_valid(bufnr)
	local is_normal_buffer = vim.bo[bufnr].buftype == ""
	local is_buffer_modifiable = vim.bo[bufnr].modifiable

	if not (is_buffer_valid and is_normal_buffer and is_buffer_modifiable) then
		return
	end

	format_and_write(bufnr)
end
