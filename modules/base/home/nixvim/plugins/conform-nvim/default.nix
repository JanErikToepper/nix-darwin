{ ... }: {
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    autoInstall.enable = true;
    settings = {
      formatters_by_ft = {
        xml = [ "xmlformatter" ];
        json = [ "fixjson" ];
        yaml = [ "yamlfix" ];
        dockerfile = [ "dockerfmt" ];
        markdown = [ "mdformat" ];
        java = [ "google-java-format" ];
        javascript = [ "prettierd" ];
        css = [ "prettierd" ];
        html = [ "prettierd" ];
        nix = [ "nixfmt" ];
        lua = [ "stylua" ];
      };

      notify_no_formatters = false;
      notify_on_error = false;
    };
  };
}
