{ pkgs, ... }:
let
  neogitPackage = pkgs.fetchFromGitHub {
    owner = "NeogitOrg";
    repo = "neogit";
    rev = "v3.0.0";
    sha256 = "sha256-aGXM/vhK+kW7CMQXfjK8mbWgR3x87pH2iwqb+2mxFDU=";
  };
in
{
  programs.nixvim.plugins.neogit = {
    enable = true;
    package = neogitPackage;
    settings = {
      disable_hint = true;
      disable_context_highlighting = true;
      disable_signs = true;
      filewatcher.enabled = false;
      process_spinner = true;
      remember_settings = false;
      auto_refresh = false;
      console_timeout = 5000;
      commit_editor.show_staged_diff = false;
      rebase_editor.kind = "tab";
      integrations = {
        telescope = true;
      };
    };
  };
}
