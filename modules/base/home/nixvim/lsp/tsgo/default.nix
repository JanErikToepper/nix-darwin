{ ... }: {
  programs.nixvim.lsp.servers.tsgo = {
    enable = true; 
    config = {
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
