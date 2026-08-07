{ config, ... }: {
  programs.nixvim.plugins.jdtls = {
    enable = true;
    settings = {
      filetypes = [ "java" "jproperties" ];
      capabilities.__raw = ''
        (function()
          local capabilities = vim.lsp.protocol.make_client_capabilities()

          capabilities.textDocument.completion.completionItem.snippetSupport = false

          return capabilities
        end)()
      '';
      init_options = {
        bundles.__raw = "require('spring_boot').java_extensions('${config.spring-boot-extension-path}/jars')";
      };
    };
  };
}
