{ ... }: let
  bitwarden = "com.bitwarden.desktop";
  teams = "com.microsoft.teams2";
in {
  programs.aerospace.settings = {
    mode.main.binding = {
      ctrl-cmd-t = "exec-and-forget open -b ${teams}";
    };

    on-window-detected = [
      {
        "if".app-id = teams;
        run = "move-node-to-workspace --focus-follows-window 3";
      }
    ];

    after-startup-command = [
      "exec-and-forget open -b ${bitwarden}"
      "exec-and-forget open -b ${teams}"
    ];
  };
}
