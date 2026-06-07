{ ... }: let 
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
        "3" = ["3" "7"]; 
      };

      gaps.outer = {
        left = 0;
        bottom = 0;
        top = 0;
        right = 0;
      };

      mode.main.binding = {
        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";

        alt-h = "focus-monitor left";  
        alt-j = "focus-monitor down";  
        alt-k = "focus-monitor up";  
        alt-l = "focus-monitor right";  

        ctrl-alt-h = "move-workspace-to-monitor left";  
        ctrl-alt-j = "move-workspace-to-monitor down";  
        ctrl-alt-k = "move-workspace-to-monitor up";  
        ctrl-alt-l = "move-workspace-to-monitor right";  

        shift-alt-h = "focus left";
        shift-alt-j = "focus down";
        shift-alt-k = "focus up";
        shift-alt-l = "focus right";

        shift-ctrl-alt-h = "move left";
        shift-ctrl-alt-j = "move down";
        shift-ctrl-alt-k = "move up";
        shift-ctrl-alt-l = "move right";

        alt-esc = "close";

        alt-space = "exec-and-forget pmset sleepnow";

        alt-comma = "volume down";
        alt-period = "volume up";
        alt-m = "volume mute-toggle";

        alt-b = "exec-and-forget open -b ${firefox}";
        alt-e = "exec-and-forget open -b ${finder}";
        alt-s = "exec-and-forget screencapture -i";
        alt-enter = "exec-and-forget open -b ${iterm2}";
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
          run = "move-node-to-workspace --focus-follows-window 4";
        }
        {
          "if" .app-id = iterm2;
          run = "move-node-to-workspace --focus-follows-window 5";
        }
      ];

      after-startup-command = [
        "exec-and-forget sketchybar"
        "exec-and-forget open -b ${firefox}"
        "exec-and-forget open -b ${iterm2}"
      ];

      exec-on-workspace-change = [ "sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE" ];
    };
  };
}
