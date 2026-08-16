{ ... }: {
  programs.nixvim.plugins.lint = {
    enable = true;
    autoInstall.enable = true;
    lintersByFt = {
      java = [ "checkstyle" ];
      javascript = [ "eslint_d" ];
      sh = [ "shellcheck" ];
    };
  };
}
