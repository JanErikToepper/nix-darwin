{ pkgs, ... }: let
  neogitPackage = pkgs.fetchFromGitHub {
    owner = "NeogitOrg"; 
    repo = "neogit";
    rev = "e106a39a8a37a9420f374545c876f8b52baf1c80";
    sha256 = "aGXM/vhK+kW7CMQXfjK8mbWgR3x87pH2iwqb+2mxFDU=";
  };
in {
  programs.nixvim.plugins.neogit = {
    enable = true; 
    package = neogitPackage;
    settings = {
      disable_hint = true;
      disable_context_highlighting = true; 
      disable_signs = true;
      filewatcher.enabled = false;
      process_spinner = true;
      telescope_sorter.__raw = ''
        function()
          return require("telescope").extensions.fzf.native_fzf_sorter()
        end 
      '';
      remember_settings = false;
      auto_refresh = false;
      console_timeout = 5000;
      commit_editor.show_staged_diff = false;
      rebase_editor.kind = "tab";
      integrations.telescope = true; 
    };
  };
}
