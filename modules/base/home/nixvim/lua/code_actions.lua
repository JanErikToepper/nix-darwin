function _G.code_action_sync(title)
	local timeout_ms = 10000

	local params = vim.lsp.util.make_range_params(0, "utf-8")
	params.context = {
		diagnostics = vim.diagnostic.get(),
	}

	local code_actions, err = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)

	log("Result: ", code_actions)

	if not code_actions or err then
		return
	end

	for _, lsp_code_actions in pairs(code_actions) do
		if lsp_code_actions.result then
			for _, code_action in pairs(lsp_code_actions.result) do
				if code_action.title and string.match(code_action.title, title) then
					if code_action.command then
						vim.lsp.buf.execute_command(action.command)
					elseif code_action.edit then
						vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
					end

					return
				end
			end
		end
	end
end
