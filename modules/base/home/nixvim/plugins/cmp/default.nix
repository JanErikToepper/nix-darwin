{ ... }: {
  programs.nixvim.plugins.cmp = {
    enable = true; 
    settings = {
      mapping = {
        "<cr>" = "cmp.mapping.confirm({ select = true })";
        "<c-n>" = "cmp.mapping.select_next_item()";
        "<c-p>" = "cmp.mapping.select_prev_item()";
        "<c-d>" = "cmp.mapping.scroll_docs(5)";
        "<c-u>" = "cmp.mapping.scroll_docs(-5)";
      }; 
      preselect = "cmp.PreselectMode.Item";
      sources = [
        {
          name = "nvim_lsp"; 
        } 
        {
          name = "path"; 
        }
      ];
    };
  };
}
