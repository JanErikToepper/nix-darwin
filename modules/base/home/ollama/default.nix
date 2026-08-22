{ pkgs, lib, ... }: {
  services.ollama.enable = true;

  home = {
    packages = with pkgs; [ ollama ];

    activation.registerOllamaJavaMentorModel = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      ${pkgs.ollama}/bin/ollama create java-mentor -f ${./Modelfile} || true
    '';
  };
}
