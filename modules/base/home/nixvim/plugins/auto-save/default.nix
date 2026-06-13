{ ... }: {
  programs.nixvim.plugins.auto-save = {
    enable = true;
    settings = {
      condition = ''
        function(buf) 
          local utils = require("auto-save.utils.data")

          local ignored_filetypes = {
            "TelescopePrompt",
            "oil",
            "spectre_panel",
            "NeogitStatus",
            "NeogitLogView",
            "DiffviewFiles",
            "gitcommit",
          }

          return utils.not_in(vim.fn.getbufvar(buf, "&filetype"), ignored_filetypes)
        end
      ''; 
      debounce_delay = 0;
    }; 
  };
}
