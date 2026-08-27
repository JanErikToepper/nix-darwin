{ ... }: {
  programs.nixvim.autoCmd = [
    {
      command = "lua require('lint').try_lint()";
      event = [
        "BufEnter"
        "TextChanged"
      ];
    }
    {
      callback.__raw = ''
        function(args)
          handle_buffer_write(args.buf)
        end'';
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
    {
      callback.__raw = ''
        function(args)
          handle_rebase_feedback(args.status)
        end
      '';
      event = "User";
      pattern = "NeogitRebase";
    }
  ];
}
