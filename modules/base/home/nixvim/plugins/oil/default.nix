{ ... }: {
  programs.nixvim.plugins.oil = {
    enable = true;
    settings = {
      cleanup_delay_ms = 0;
      keymaps = {
        "<c-q>" = "actions.close";
      }; 
      prompt_save_on_select_new_entry = false;
      skip_confirm_for_simple_edits = true;
      lsp_file_method = {
        autosave_changes = true;
        timeout_ms = 10000; 
      };
      preview.border = null;
      progress.border = null;
      ssh.border = null;
      view_options = {
        natural_order = false;
        show_hidden = true; 
      };
    }; 
  };
}
