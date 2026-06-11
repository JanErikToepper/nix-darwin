{ ... }: let
  steam = "com.valvesoftware.steam"; 
in {
  programs.aerospace.settings = {
    mode.main.binding = {
      cmd-g = "exec-and-forget open -b ${steam}";
    };

    on-window-detected = [
      {
        "if".app-id = "com.factorio";
        run = "move-node-to-workspace 9";
      }
      {
        "if".app-id = steam;
        run = "move-node-to-workspace 8";
      }
    ];
  };
}
