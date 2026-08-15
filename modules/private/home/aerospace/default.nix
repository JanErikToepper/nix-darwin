{ ... }:
let
  steam = "com.valvesoftware.steam";
in
{
  programs.aerospace.mode.main.binding = {
    ctrl-cmd-g = "exec-and-forget -b ${steam}";
  };
}
