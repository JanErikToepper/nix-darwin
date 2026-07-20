{ ... } @ inputs: { 
  imports = [
    inputs.nixvim.homeModules.nixvim  
    ./autocmd
    ./colorschemes
    ./diagnostics
    ./editorconfig
    ./keymaps
    ./lua
    ./opts
    ./plugins
  ];

  programs.nixvim = {
    enable = true; 

    dependencies = {
      tree-sitter.enable = true; 
      gcc.enable = true;
    };
  };
}
