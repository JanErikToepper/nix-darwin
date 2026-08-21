function _G.code_action_sync(title, _bufnr)
	local bufnr = _bufnr or vim.api.nvim_get_current_buf()

	local timeout_ms = 10000

	local line = vim.api.nvim_win_get_cursor(0)[1] - 1

	local nvim_diagnostics = vim.diagnostic.get(bufnr, { lnum = line })
	local lsp_diagnostics = {}

	for _, d in ipairs(nvim_diagnostics) do
		table.insert(lsp_diagnostics, {
			range = {
				start = {
					line = d.lnum,
					character = d.col,
				},
				["end"] = {
					line = d.end_lnum,
					character = d.end_col,
				},
			},
			severity = d.severity,
			code = d.code,
			source = d.source or "nvim-lsp",
			message = d.message,
		})
	end

	local params = vim.lsp.util.make_range_params(0, "utf-8")
	params.context = {
		diagnostics = lsp_diagnostics,
	}

	local code_actions, err = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)

	if not code_actions or err then
		return
	end

	for client_id, lsp_code_actions in pairs(code_actions) do
		if lsp_code_actions.result then
			for _, code_action in pairs(lsp_code_actions.result) do
				if code_action.title and string.match(code_action.title, title) then
					local final_code_action = code_action

					local client = vim.lsp.get_client_by_id(client_id)
					if not (code_action.command or code_action.edit) then
						local code_action, err = client:request_sync("codeAction/resolve", code_action, timeout_ms, 0)

						if not err and code_action and code_action.result then
							final_code_action = code_action.result
						end
					end

					if final_code_action.command then
						vim.lsp.buf.execute_command(final_code_action.command)
					elseif final_code_action.edit then
						vim.lsp.util.apply_workspace_edit(final_code_action.edit, client.offset_encoding)
					end

					return
				end
			end
		end
	end
end
