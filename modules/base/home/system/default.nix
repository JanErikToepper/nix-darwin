{ ... }: {
  targets.darwin.defaults = {
    "com.apple.finder".ShowStatusBar = false;
    NSGlobalDomain = {
      AppleLanguages = [ "en" "de" ];
      AppleLocale = "de_DE";
    };
  };
}
