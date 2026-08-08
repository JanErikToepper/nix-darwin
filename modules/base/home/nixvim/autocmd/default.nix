{ ... }: {
  programs.nixvim.autoCmd = [
    {
      command = "lua handle_open_buffers()";
      event = "BufNew";
    }
    {
      callback.__raw = "function(args) require('conform').format({ bufnr = args.buf }) end";
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
