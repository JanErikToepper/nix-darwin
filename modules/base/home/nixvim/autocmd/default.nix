{ ... }: {
  programs.nixvim.autoCmd = [
    {
      command = "lua handle_open_buffers()"; 
      event = "BufNew";
    } 
    {
      command = "silent lua handle_buffer_write()"; 
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
