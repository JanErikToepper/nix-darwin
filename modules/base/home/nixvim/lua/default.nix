{ lib, ... }: {
  programs.nixvim.extraConfigLua = lib.concatMapStrings (file: builtins.readFile file) [
    ./autocmds.lua
    ./git.lua
    ./status_line.lua
    ./utils.lua
  ];
}
