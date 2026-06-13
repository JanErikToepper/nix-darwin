{ ... }: {
  programs.nixvim.plugins.neogit = {
    enable = true; 
    settings = {
      disable_hint = true;
      disable_context_highlighting = true; 
      disable_signs = true;
      filewatcher.enabled = false;
      process_spinner = true;
      telescope_sorter.__raw = ''
        function()
          return require("telescope").extensions.fzf.native_fzf_sorter()
        end 
      '';
      remember_settings = false;
      auto_refresh = false;
      console_timeout = 5000;
      commit_editor.show_staged_diff = false;
      rebase_editor.kind = "tab";
      integrations.telescope = true; 
    };
  };
}
