{ lib, ... }: {
  programs.nixvim.extraConfigLua = lib.concatMapStrings (file: builtins.readFile file) [
    ./autocmd.lua
    ./code_action_sync.lua
    ./git.lua
    ./log.lua
    ./lsp.lua
    ./status_line.lua
    ./utils.lua
  ];
}
