{ pkgs, ... }: let 
  bitwarden = "com.bitwarden.desktop";
  datagrip = "com.jetbrains.datagrip";
  docker = "com.electron.dockerdesktop";
  figma = "com.figma.Desktop";
  finder = "com.apple.finder";
  firefox = "org.nixos.firefox"; 
  kitty = "net.kovidgoyal.kitty";
in {
  /*
    1 = Firefox
    2 = Kitty
    3 = Communication
    4 = Kitty
    5 = Firefox
    6 = Datagrip
    7 = Figma
    8 = Bitwarden
    9 = Docker
  */

  programs.aerospace = {
    enable = true;

    launchd = {
      enable = true;
      keepAlive = true;
    };

    settings = {
      config-version = 2;

      persistent-workspaces = [ "1" "2" "3" ];

      workspace-to-monitor-force-assignment = {
        "1" = 1;
        "2" = 2;
        "3" = 3;
        "4" = 1;
        "5" = 2;
        "6" = 1;
        "7" = 2;
        "8" = 3;
        "9" = 2;
      };

      gaps = {
        inner = {
          horizontal = 0; 
          vertical = 0; 
        };
        outer = {
          left = 0;
          bottom = 0;
          top = 40;
          right = 0;
        };
      };

      mode.main.binding = {
        cmd-1 = "workspace 1";
        cmd-2 = "workspace 2";
        cmd-3 = "workspace 3";
        cmd-4 = "workspace 4";
        cmd-5 = "workspace 5";
        cmd-6 = "workspace 6";
        cmd-7 = "workspace 7";
        cmd-8 = "workspace 8";
        cmd-9 = "workspace 9";
        cmd-0 = "workspace 0";

        ctrl-cmd-1 = [ "move-node-to-workspace --focus-follows-window 1"];
        ctrl-cmd-2 = [ "move-node-to-workspace --focus-follows-window 2"];
        ctrl-cmd-3 = [ "move-node-to-workspace --focus-follows-window 3"];
        ctrl-cmd-4 = [ "move-node-to-workspace --focus-follows-window 4"];
        ctrl-cmd-5 = [ "move-node-to-workspace --focus-follows-window 5"];
        ctrl-cmd-6 = [ "move-node-to-workspace --focus-follows-window 6"];
        ctrl-cmd-7 = [ "move-node-to-workspace --focus-follows-window 7"];
        ctrl-cmd-8 = [ "move-node-to-workspace --focus-follows-window 8"];
        ctrl-cmd-9 = [ "move-node-to-workspace --focus-follows-window 9"];
        ctrl-cmd-0 = [ "move-node-to-workspace --focus-follows-window 0"];

        cmd-h = "focus --boundaries all-monitors-outer-frame left";  
        cmd-j = "focus --boundaries all-monitors-outer-frame down";  
        cmd-k = "focus --boundaries all-monitors-outer-frame up";  
        cmd-l = "focus --boundaries all-monitors-outer-frame right";  

        ctrl-cmd-h = "move-workspace-to-monitor left";
        ctrl-cmd-j = "move-workspace-to-monitor down";
        ctrl-cmd-k = "move-workspace-to-monitor up";
        ctrl-cmd-l = "move-workspace-to-monitor right";

        cmd-s = "exec-and-forget screencapture -i -c";
        cmd-esc = "close";
        cmd-backspace = "exec-and-forget pmset sleepnow";

        cmd-comma = "volume down";
        cmd-period = "volume up";
        cmd-m = "volume mute-toggle";

        ctrl-cmd-b = "exec-and-forget open -nb ${firefox}";
        ctrl-cmd-d = "exec-and-forget open -b ${docker}";
        ctrl-cmd-e = "exec-and-forget open -b ${finder}";
        ctrl-cmd-f = "exec-and-forget open -b ${figma}";
        ctrl-cmd-p = "exec-and-forget open -b ${bitwarden}";
        ctrl-cmd-s = "exec-and-forget open -b ${datagrip}";
        ctrl-cmd-enter = "exec-and-forget open -nb ${kitty}";
      };

      on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];

      on-window-detected = [
        {
          "if".workspace = "0";
          run = "balance-sizes";
        }
        {
          "if".app-id = bitwarden;
          run = "move-node-to-workspace --focus-follows-window 8";
        }
        {
          "if".app-id = datagrip;
          run = "move-node-to-workspace --focus-follows-window 6";
        }
        {
          "if".app-id = docker;
          run = "move-node-to-workspace 9";
        }
        {
          "if".app-id = figma;
          run = "move-node-to-workspace --focus-follows-window 7";
        }
        {
          "if" .app-id = firefox;
          "if".workspace = "5";
          run = "balance-sizes";
        }
        {
          "if" .app-id = firefox;
          run = "move-node-to-workspace --focus-follows-window 1";
        }
        {
          "if".app-id = kitty;
          "if".workspace = "4";
          run = "balance-sizes";
        }
        {
          "if" .app-id = kitty;
          run = "move-node-to-workspace --focus-follows-window 2";
        }
      ];

      after-startup-command = [
        "exec-and-forget sketchybar"
        "exec-and-forget open -b ${firefox}"
        "exec-and-forget open -b ${kitty}"
        "exec-and-forget open -b ${docker}"
      ];

      exec-on-workspace-change = [ "${pkgs.bash}/bin/bash" "-c" "${pkgs.sketchybar}/bin/sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE" ];
    };
  };
}
