{ ... }: {
  programs.nixvim.plugins.lsp.servers.ts_ls = {
    enable = true;
    settings = {
      init_options = {
        preferences = {
          organizeImportsIgnoreCase = false; 
          organizeImportsCollation = "unicode";
          organizeImportsNumericCollation = true;
          organizeImportsCaseFirst = "lower";
          preferTypeOnlyAutoImports = true;
          providePrefixAndSuffixTextForRename = false;
          includePackageJsonAutoImports = "on";
        }; 
      }; 
    };
    onAttach.function = ''
      if client.name ~= 'ts_ls' then return end

      local attached_clients = vim.lsp.get_clients({ bufnr = bufnr })

      for _, attached_client in ipairs(attached_clients) do
        if attached_client.name ~= 'angularls' then 
          client.capabilities.textDocument.references.dynamicRegistration = false

          break
        end
      end
    '';
  };
}
