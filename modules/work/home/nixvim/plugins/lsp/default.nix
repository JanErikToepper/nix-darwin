{ ... }: {
  imports = [ ./tailwindcss ];

  programs.nixvim.plugins.lsp.servers = {
    angularls.enable = true;
  };
}
