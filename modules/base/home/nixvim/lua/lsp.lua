function _G.is_lsp_attached(lsp)
	local clients = vim.lsp.get_clients({ bufnr = 0, name = lsp })

	return not vim.tbl_isempty(clients)
end

function _G.apply_code_action(title)
	code_action_sync(title)

	local bufnr = vim.api.nvim_get_current_buf()

	if is_lsp_attached("jdtls") then
		code_action_sync("Sort Members for")
	end

	format_and_write(bufnr)
end
