{ ... }: {
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
      };

      gaps.outer = {
        left = 0;
        bottom = 0;
        top = 0;
        right = 0;
      };

      mode.main.binding = {
        ctrl-alt-h = "focus left";  
        ctrl-alt-j = "focus down";  
        ctrl-alt-k = "focus up";  
        ctrl-alt-l = "focus right";  
      };

      on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];

      on-window-detected = [
        {
          "if".app-id = "com.googlecode.iterm2";
          run = "move-node-to-workspace 2";
        }
      ];

      after-startup-command = [
        "exec-and-forget open -a com.googlecode.iterm2"
      ];
    };
  };
}
