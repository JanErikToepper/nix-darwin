{ pkgs, ... }: {
  config.home.packages = with pkgs; [
    entr
    md-tui
  ];

  config.customScripts.answer = pkgs.writeShellApplication {
    name = "answer";
    runtimeInputs = with pkgs; [
      entr
      md-tui
    ];
    text = builtins.readFile ./answer.sh;
  };
}
