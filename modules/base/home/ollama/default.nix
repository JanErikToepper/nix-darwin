{ pkgs, lib, ... }: {
  services.ollama.enable = true;

  home = {
    packages = with pkgs; [ ollama ];

    activation.registerOllamaJavaMentorModel = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      ${pkgs.ollama}/bin/ollama create java-mentor -f ${./modelfiles/JAVA_MENTOR} || true
      ${pkgs.ollama}/bin/ollama create java-reviewer -f ${./modelfiles/JAVA_REVIEWER} || true
    '';
  };
}
