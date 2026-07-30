{ ... }: {
  programs.nixvim.plugins.jdtls = {
    enable = true;
    settings = {
      capabilities.__raw = ''
        (function()
          local capabilities = vim.lsp.protocol.make_client_capabilities()

          capabilities.textDocument.completion.completionItem.snippetSupport = false

          return capabilities
        end)()
      '';
    };
  };
}
