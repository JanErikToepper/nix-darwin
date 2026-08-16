{ ... }: {
  programs.nixvim.plugins.spectre = {
    enable = true;
    settings = {
      open_cmd = "tabnew";
      mapping = {
        "close_spectre" = {
          map = "q";
          cmd = "<cmd>lua require('spectre').close()<cr>";
        };
        "run_current_replace" = {
          map = "<leader>r";
          cmd = "<cmd>lua require('spectre.actions').run_current_replace()<cr>";
        };
      };
      is_insert_mode = true;
      is_block_ui_break = true;
    };
  };
}
