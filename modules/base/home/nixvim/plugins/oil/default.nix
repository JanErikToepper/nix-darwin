{ ... }: {
  programs.nixvim.plugins.oil = {
    enable = true;
    settings = {
      skip_confirm_for_simple_edits = true;
      prompt_save_on_select_new_entry = false;
      cleanup_delay_ms = false;
      lsp_file_method = {
        timeout_ms = 10000;
        autosave_changes = true;
      };
      keymaps = {
        "<c-q>" = "actions.close";
      };
      view_options = {
        show_hidden = true;
        natural_order = false;
      };
    };
  };
}
