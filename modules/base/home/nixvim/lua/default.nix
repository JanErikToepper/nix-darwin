{ lib, ... }: {
  programs.nixvim.extraConfigLua = lib.concatMapStrings (file: builtins.readFile file) [
    ./autocmd.lua
    ./code_actions.lua
    ./git.lua
    ./log.lua
    ./status_line.lua
    ./utils.lua
  ];
}
