{ ... }: {
  programs.nixvim.autoCmd = [
    {
      command = "lua handle_open_buffers()";
      event = "BufNew";
    }
    {
      command = "lua require('lint').try_lint()";
      event = [
        "BufEnter"
        "TextChanged"
      ];
    }
    {
      command = "lua handle_buffer_format()";
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
