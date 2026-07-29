{ ... }: {
  programs.nixvim.plugins.lsp.servers.jdtls = {
    enable = true;
    extraOptions = {
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
