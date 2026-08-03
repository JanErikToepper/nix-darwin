{ ... }: {
  programs.nixvim.plugins.lsp.servers = {
    angularls.enable = true;
    tailwindcss.enable = true;
  }; 
}
