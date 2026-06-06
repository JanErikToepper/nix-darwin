{ ... }: {
  programs.aerospace = {
    enable = true;

    launchd = {
      enable = true;
      keepAlive = true;
    };

    settings = {
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
        alt-h = "focus left";  
        alt-j = "focus down";  
        alt-k = "focus up";  
        alt-l = "focus right";  
      };

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
