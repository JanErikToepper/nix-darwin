{ ... }: {
  imports = [
    ./auto-save
    ./cmp
    ./codediff
    ./diffview
    ./gitsigns
    ./jdtls
    ./lsp
    ./markview
    ./neogit
    ./none-ls
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
