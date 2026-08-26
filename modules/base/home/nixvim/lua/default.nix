{ lib, ... }: {
  programs.nixvim.extraConfigLua = lib.concatMapStrings (file: builtins.readFile file) [
    ./autocmd.lua
    ./code_action_sync.lua
    ./git.lua
    ./log.lua
    ./lsp.lua
    ./statusline.lua
    ./utils.lua
    ./init.lua
  ];
}
