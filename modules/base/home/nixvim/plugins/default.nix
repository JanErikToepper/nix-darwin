{ ... }: {
  imports = [
    ./auto-save
    ./cmp
    ./diffview
    ./gitsigns
    ./harpoon
    ./lsp
    ./markview
    ./neogit
    ./none-ls
    ./notify
    ./oil
    ./spectre
    ./telescope
    ./treesitter
  ];

  programs.nixvim.plugins = {
    autoclose.enable = true; 
    jdtls.enable = true;
    tmux-navigator.enable = true;
    ts-autotag.enable = true;
    web-devicons.enable = true;
  };
}
