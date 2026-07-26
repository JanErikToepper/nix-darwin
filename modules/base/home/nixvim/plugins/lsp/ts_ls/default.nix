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
  };
}
