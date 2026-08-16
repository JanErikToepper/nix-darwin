function _G.handle_open_buffers()
	local open_buffers = vim.fn.getbufinfo({
		bufloaded = true,
		buflisted = true,
	})

	if not open_buffers or #open_buffers == 0 then
		return
	end

	table.sort(open_buffers, function(first_open_buffer, second_open_buffer)
		return first_open_buffer.lastused > second_open_buffer.lastused
	end)

	local amount_of_buffers_to_keep_open = 10

	for i = amount_of_buffers_to_keep_open, #open_buffers, 1 do
		local buffer_id_to_delete = open_buffers[i].bufnr

		vim.api.nvim_buf_delete(buffer_id_to_delete, { force = true })
	end
end

function _G.handle_buffer_format()
	local modifiable = vim.bo.modifiable

	if not modifiable then
		return
	end

	format()
end
