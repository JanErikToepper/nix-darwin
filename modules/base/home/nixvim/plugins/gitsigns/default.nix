{ ... }: {
  programs.nixvim.plugins.gitsigns = {
    enable = true; 
    settings = {
      numhl = true;
      diff_opts = {
        algorithm = "histogram"; 
        internal = true;
      }; 
      signs = {
        add.text = "┃"; 
        change.text = "┃"; 
        changedelete.text = "┃"; 
        delete.text = "┃"; 
        topdelete.text = "┃"; 
      };
    };
  };
}
