{ ... }: {
  programs.opencode = {
    enable = true;
    settings = {
      provider = {
        ollama = {
          npm = "@ai-sdk/openai-compatible";
          name = "Ollama";
          options = {
            baseURL = "http://localhost:11434/v1";
          };
          models = {
            "java-reviewer" = {
              name = "java-reviewer";
            };
          };
        };
      };
    };
  };
}
