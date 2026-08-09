{ ... }: {
  programs.nixvim.plugins = {
    codediff = {
      enable = true;
      settings = {
        diff = {
          ignore_trim_whitespaces = true;
          hide_merge_artifacts = true;
          original_position = "left";
          conflict_ours_position = "left";
          conflict_result_position = "center";
          compute_moves = true;
          compact_context_lines = 5;
        };
        explorer = {
          view_mode = "tree";
          auto_open_on_cursor = true;
        };
        keymaps = {
          view = {
            next_hunk = "<leader>n";
            prev_hunk = "<leader>p";
            next_file = "<tab>";
            prev_file = "<s-tab>";
          };
          conflict = {
            next_conflict = "<leader>N";
            prev_conflict = "<leader>P";
          };
        };
      };
    };

    neogit.settings.integrations.codediff = true;

    telescope.extensions.advanced-git-search.settings.diff_plugin = "codediff";
  };
}
