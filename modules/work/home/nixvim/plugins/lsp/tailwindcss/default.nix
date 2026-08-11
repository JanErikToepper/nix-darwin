{ ... }: {
  programs.nixvim.plugins.lsp.servers.tailwindcss = {
    enable = true;
    settings = {
      filetypes = [
        "html"
        "css"
        "scss"
        "javascript"
        "typescript"
      ];
    };
  };
}
