{ pkgs, ... }: {
  config.home.packages = with pkgs; [
    entr
    md-tui
  ];

  config.customScripts.chat = pkgs.writeShellApplication {
    name = "chat";
    runtimeInputs = with pkgs; [
      entr
      md-tui
    ];
    text = builtins.readFile ./chat.sh;
  };
}
