{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [ nvim-lsp-file-operations ];

    extraConfigLua = "require('lsp-file-operations').setup()";
  };
}
