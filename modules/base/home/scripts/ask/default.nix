{ pkgs, ... }: {
  config.home.packages = with pkgs; [
    pandoc
    md-tui
  ];

  config.customScripts.ask = pkgs.writeShellApplication {
    name = "ask";
    runtimeInputs = with pkgs; [
      pandoc
      md-tui
    ];
    text = builtins.readFile ./ask.sh;
  };
}
