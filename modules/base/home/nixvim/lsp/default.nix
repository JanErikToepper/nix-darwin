{ ... }: {
  imports = [ ./ts_ls ];

  programs.nixvim.lsp = {
    keymaps = [
      {
        key = "ga"; 
        lspBufAction = "code_action";
      } 
      {
        key = "gr"; 
        lspBufAction = "rename";
      }
    ]; 

    servers = {
      bashls.enable = true; 
      cssls.enable = true;
      diagnosticsls.enable = true;
      dockerls.enable = true;
      html.enable = true;
      jdtls.enable = true;
      jsonls.enable = true;
      lua_ls.enable = true;
      marksman.enable = true;
      nixd.enable = true;
      tailwindcss.enable = true;
    };
  };
}
