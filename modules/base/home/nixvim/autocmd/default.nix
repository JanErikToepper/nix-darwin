{ ... }: {
  programs.nixvim.autoCmd = [
    {
      command = "lua handle_open_buffers()"; 
      event = "BufNew";
    } 
    {
      command = "silent lua pcall(function() vim.cmd('undojoin') end) vim.lsp.buf.format({ filter = function(client) return client.name == 'null-ls' end })"; 
      event = [
        "BufWritePre" 
        "BufLeave"
      ];
    }
    {
      command = "nnoremap <buffer> q <cmd>cclose<cr>"; 
      event = "FileType";
      pattern = "qf";
    }
  ];
}
