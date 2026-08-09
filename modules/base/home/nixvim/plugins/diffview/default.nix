{ ... }:
let
  commonKeymaps = [
    {
      mode = "n";
      key = "q";
      action = "<cmd>DiffviewClose<cr>";
    }
    {
      mode = "n";
      key = "gf";
      action = "<cmd>lua require('diffview.actions').goto_file_tab()<cr>";
    }
  ];
in
{
  programs.nixvim.plugins = {
    diffview = {
      enable = true;
      settings = {
        enhanced_diff_hl = true;
        show_help_hints = false;
        file_panel = {
          tree_options.folder_statuses = "never";
          win_config.width = 50;
        };
        keymaps = {
          view = [
            {
              mode = "n";
              key = "<leader>n";
              action = "]c";
            }
            {
              mode = "n";
              key = "<leader>N";
              action = "<cmd>lua require('diffview.actions').next_conflict()<cr>";
            }
            {
              mode = "n";
              key = "<leader>p";
              action = "[c";
            }
            {
              mode = "n";
              key = "<leader>P";
              action = "<cmd>lua require('diffview.actions').prev_conflict()<cr>";
            }
          ]
          ++ commonKeymaps;
          file_panel = commonKeymaps;
        };
      };
    };

    neogit.settings.integrations.diffview = true;

    telescope.extensions.advanced-git-search.settings.diff_plugin = "diffview";
  };
}
