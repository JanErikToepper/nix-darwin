{ ... }: {
  imports = [ ./ts_ls ];

  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      bashls.enable = true; 
      cssls.enable = true;
      diagnosticls.enable = true;
      dockerls.enable = true;
      html.enable = true;
      jsonls.enable = true;
      lemminx.enable = true;
      lua_ls.enable = true;
      marksman.enable = true;
      nixd.enable = true;
    };
  };
}
