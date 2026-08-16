{ ... }: {
  imports = [ ./extensions ];

  programs.nixvim.plugins = {
    telescope = {
      enable = true;
      extensions.fzf-native.enable = true;
      settings = {
        defaults = {
          layout_config.horizontal = {
            width = 0.999;
            height = 0.999;
            preview_cutoff = 0;
          };
          prompt_prefix = " ";
          selection_caret = "  ";
          path_display = [ "truncate" ];
          borderchars = [
            "─"
            "│"
            "─"
            "│"
            "┌"
            "┐"
            "┘"
            "└"
          ];
          results_title = false;
          prompt_title = false;
          history = false;
          preview.timeout = 1000;
          file_ignore_patterns = [
            "%.git%/"
            "package-lock%.json"
          ];
        };
        pickers.git_branches = {
          mappings = {
            i = {
              "<cr>".__raw = "require('telescope.actions').git_switch_branch";
            };
          };
        };
      };
    };

    neogit.settings.integrations.telescope = true;
  };
}
