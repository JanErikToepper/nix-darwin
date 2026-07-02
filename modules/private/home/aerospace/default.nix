{ ... }: let
  steam = "com.valvesoftware.steam";
  factorio = "com.factorio";
in {
  programs.aerospace.settings = {
    mode.main.binding = {
      ctrl-cmd-g = "exec-and-forget open -b ${steam}";
    }; 

    on-window-detected = [
      {
        "if".app-id = steam;
        run = "move-node-to-workspace --focus-follows-window 0";
      }
      {
        "if".app-id = factorio;
        run = "move-node-to-workspace --focus-follows-window 0";
      }
    ];
  };
}
