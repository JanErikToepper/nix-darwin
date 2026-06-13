{ pkgs, ... }: let 
  bitwarden = "com.bitwarden.desktop";
  finder = "com.apple.finder";
  firefox = "org.nixos.firefox"; 
  kitty = "net.kovidgoyal.kitty";
in {
  programs.aerospace = {
    enable = true;

    package = pkgs.aerospace;

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
        "5" = 1;
        "6" = 2;
        "7" = 3;
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

        alt-cmd-1 = [ "move-node-to-workspace 1" "workspace 1"];
        alt-cmd-2 = [ "move-node-to-workspace 2" "workspace 2"];
        alt-cmd-3 = [ "move-node-to-workspace 3" "workspace 3"];
        alt-cmd-4 = [ "move-node-to-workspace 4" "workspace 4"];
        alt-cmd-5 = [ "move-node-to-workspace 5" "workspace 5"];
        alt-cmd-6 = [ "move-node-to-workspace 6" "workspace 6"];
        alt-cmd-7 = [ "move-node-to-workspace 7" "workspace 7"];
        alt-cmd-8 = [ "move-node-to-workspace 8" "workspace 8"];
        alt-cmd-9 = [ "move-node-to-workspace 9" "workspace 9"];

        cmd-h = "focus --boundaries all-monitors-outer-frame left";  
        cmd-j = "focus --boundaries all-monitors-outer-frame down";  
        cmd-k = "focus --boundaries all-monitors-outer-frame up";  
        cmd-l = "focus --boundaries all-monitors-outer-frame right";  

        alt-cmd-h = "move-workspace-to-monitor left";  
        alt-cmd-j = "move-workspace-to-monitor down";  
        alt-cmd-k = "move-workspace-to-monitor up";  
        alt-cmd-l = "move-workspace-to-monitor right";  

        cmd-esc = "close";

        cmd-space = "exec-and-forget pmset sleepnow";

        cmd-comma = "volume down";
        cmd-period = "volume up";
        cmd-m = "volume mute-toggle";

        cmd-b = "exec-and-forget open -nb ${firefox}";
        cmd-e = "exec-and-forget open -b ${finder}";
        cmd-p = "exec-and-forget open -nb ${bitwarden}";
        cmd-s = "exec-and-forget screencapture -i -c";
        cmd-enter = "exec-and-forget open -nb ${kitty}";
      };

      on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];

      on-window-detected = [
        {
          "if".app-id = firefox;
          "if".during-aerospace-startup = true;
          run = "move-node-to-workspace 1";
        }
        {
          "if".app-id = kitty;
          "if".during-aerospace-startup = true;
          run = "move-node-to-workspace 2";
        }
        {
          "if".app-id = bitwarden;
          run = "move-node-to-workspace --focus-follows-window 7";
        }
        {
          "if" .app-id = firefox;
          run = "move-node-to-workspace --focus-follows-window 1";
        }
        {
          "if" .app-id = kitty;
          run = "move-node-to-workspace --focus-follows-window 4";
        }
      ];

      after-startup-command = [
        "exec-and-forget sketchybar"
        "exec-and-forget open -nb ${firefox}"
        "exec-and-forget open -nb ${kitty}"
      ];

      exec-on-workspace-change = [ "${pkgs.bash}/bin/bash" "-c" "${pkgs.sketchybar}/bin/sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE" ];
    };
  };
}
