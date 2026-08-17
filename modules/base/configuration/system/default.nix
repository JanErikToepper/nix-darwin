{ config, ... }: {
  power.sleep.display = "never";

  system = {
    primaryUser = config.user;
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
      userKeyMapping = [
        {
          HIDKeyboardModifierMappingSrc = 30064771303;
          HIDKeyboardModifierMappingDst = 30064771113;
        }
      ];
    };
    defaults = {
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.0;
      };
      trackpad = {
        TrackpadPinch = true;
        ActuateDetents = false;
        TrackpadRightClick = true;
      };
      finder = {
        ShowPathbar = true;
        CreateDesktop = false;
        NewWindowTarget = "Desktop";
        _FXSortFoldersFirst = true;
        FXPreferredViewStyle = "Nlsv";
        FXRemoveOldTrashItems = true;
        _FXShowPosixPathInTitle = true;
        _FXEnableColumnAutoSizing = true;
        FXEnableExtensionChangeWarning = false;
      };
      screencapture = {
        target = "clipboard";
        disable-shadow = true;
      };
      NSGlobalDomain = {
        KeyRepeat = 2;
        InitialKeyRepeat = 15;
        AppleShowAllFiles = true;
        AppleShowScrollBars = "Always";
        AppleInterfaceStyle = "Dark";
        NSUseAnimatedFocusRing = false;
        AppleShowAllExtensions = true;
        AppleIconAppearanceTheme = "RegularDark";
        NSTableViewDefaultSizeMode = 1;
        AppleScrollerPagingBehavior = true;
        "com.apple.trackpad.scaling" = 2.0;
        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.swipescrolldirection" = false;
        NSAutomaticCapitalizationEnabled = false;
        NSDocumentSaveNewDocumentsToCloud = false;
        NSAutomaticWindowAnimationsEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        _HIHideMenuBar = true;
      };
      loginwindow = {
        GuestEnabled = false;
        autoLoginUser = "toepper";
        RestartDisabled = true;
        ShutDownDisabled = true;
        DisableConsoleAccess = true;
        RestartDisabledWhileLoggedIn = true;
        ShutDownDisabledWhileLoggedIn = true;
        PowerOffDisabledWhileLoggedIn = true;
      };
      controlcenter = {
        BatteryShowPercentage = true;
      };
      ".GlobalPreferences" = {
        "com.apple.mouse.scaling" = 1.0;
      };
      SoftwareUpdate = {
        AutomaticallyInstallMacOSUpdates = true;
      };
      spaces.spans-displays = false;
      screensaver = {
        askForPassword = true;
        askForPasswordDelay = 0;
      };
      WindowManager.StandardHideWidgets = true;
    };
  };
}
