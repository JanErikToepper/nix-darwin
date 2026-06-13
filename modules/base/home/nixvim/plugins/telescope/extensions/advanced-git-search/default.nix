{ ... }: {
  programs.nixvim.plugins.telescope.extensions.advanced-git-search = {
    enable = true;
    settings = {
      diff_plugin = "diffview"; 
      show_builtin_git_pickers = true;
      keymaps = {
        show_entire_commit = "<cr>";
      };
    }; 
  };
}
