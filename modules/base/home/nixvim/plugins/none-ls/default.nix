{ ... }: {
  programs.nixvim.plugins.none-ls = {
    enable = true;
    sources.formatting = {
      google_java_format.enable = true;
      prettierd = {
        enable = true; 
        disableTsServerFormatter = true;
      };
    };
  };
}
