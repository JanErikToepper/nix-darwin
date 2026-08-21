{ ... }: {
  imports = [
    ./cmp
    ./conform-nvim
    ./diffview
    ./gitsigns
    ./jdtls
    ./lint
    ./lsp
    ./lsp-file-operations
    ./markview
    ./neogit
    ./notify
    ./oil
    ./spectre
    ./spring-boot
    ./telescope
    ./treesitter
  ];

  programs.nixvim.plugins = {
    autoclose.enable = true;
    tmux-navigator.enable = true;
    ts-autotag.enable = true;
    web-devicons.enable = true;
  };
}
