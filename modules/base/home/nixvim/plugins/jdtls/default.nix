{ ... }: {
  programs.nixvim.plugins.jdtls = {
    enable = true;
    settings = {
      settings.java = {
        completion = {
          favoriteStaticMembers = [
            "java.util.Objects.requireNonNull"
            "java.util.Objects.requireNonNullElse"
            "java.util.stream.Collectors.*"
            "java.nio.charset.StandardCharsets.*"
            "java.util.function.Predicate.*"
            "org.junit.jupiter.api.Assertions.*"
            "org.junit.jupiter.api.Assumptions.*"
            "org.junit.jupiter.api.DynamicContainer.*"
            "org.junit.jupiter.api.DynamicTest.*"
            "org.assertj.core.api.Assertions.*"
            "org.mockito.Mockito.*"
            "org.mockito.ArgumentMatchers.*"
            "org.mockito.Answers.*"
            "org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*"
            "org.springframework.test.web.servlet.result.MockMvcResultMatchers.*"
            "org.springframework.test.web.servlet.setup.MockMvcBuilders.*"
          ];
          filteredTypes = [
            "java.awt.*"
            "com.sun.*"
            "sun.*"
            "jdk.*"
            "org.graalvm.*"
            "io.micrometer.shaded.*"
          ];
        };
        sources = {
          organizeImports = {
            starThreshold = 9999;
            staticStarThreshold = 9999;
          };
        };
        codeGeneration = {
          toString = {
            template = "\${object.className}[\${member.name()}=\${member.value}, \${otherMembers}]";
          };
          hashCodeEquals = {
            useJava7Objects = true;
          };
          useBlocks = true;
        };
      };
      capabilities.__raw = ''
        (function()
          local capabilities = vim.lsp.protocol.make_client_capabilities()

          capabilities.textDocument.completion.completionItem.snippetSupport = true

          return capabilities
        end)()
      '';
    };
  };
}
