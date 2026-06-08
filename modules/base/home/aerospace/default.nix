{ pkgs, ... }: let 
  finder = "com.apple.finder";
  firefox = "org.nixos.firefox"; 
  iterm2 = "com.googlecode.iterm2";
in {
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
        "1" = ["1" "4" "5"]; 
        "2" = ["2" "6"]; 
        "3" = ["3"]; 
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

        cmd-b = "exec-and-forget open -b ${firefox}";
        cmd-e = "exec-and-forget open -b ${finder}";
        cmd-s = "exec-and-forget screencapture -i";
        cmd-enter = "exec-and-forget open -b ${iterm2}";
      };

      on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];

      on-window-detected = [
        {
          "if".app-id = firefox;
          "if".during-aerospace-startup = true;
          run = "move-node-to-workspace 1";
        }
        {
          "if".app-id = iterm2;
          "if".during-aerospace-startup = true;
          run = "move-node-to-workspace 2";
        }
        {
          "if" .app-id = firefox;
          run = "move-node-to-workspace --focus-follows-window 1";
        }
        {
          "if" .app-id = iterm2;
          run = "move-node-to-workspace --focus-follows-window 4";
        }
      ];

      after-startup-command = [
        "exec-and-forget sketchybar"
        "exec-and-forget open -b ${firefox}"
        "exec-and-forget open -b ${iterm2}"
      ];

      exec-on-workspace-change = [ "/bin/bash" "-c" "${pkgs.sketchybar}/bin/sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE" ];
    };
  };
}
