{ ... }: let
  steam = "com.valvesoftware.steam"; 
in {
  programs.aerospace.settings = {
    workspace-to-monitor-force-assignment = {
      "2" = ["2" "6" "9"]; 
      "3" = ["8"];
    };

    mode.main.binding = {
      cmd-9 = "workspace 9";
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
