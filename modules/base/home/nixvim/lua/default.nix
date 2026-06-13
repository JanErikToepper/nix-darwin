{ ... }: {
  programs.nixvim.extraConfigLua = builtins.readFile ./config.lua;
}
