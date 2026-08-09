{
  pkgs,
  ...
}:
let
  spring-boot-extension = pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-spring-boot";
    publisher = "vmware";
    version = "2.4.2026080100";
    sha256 = "sha256-4/HHmD49SA3mj+xw+34dZbzkt3o3Z4EOOwqD0VMruY4=";
  };

  spring-boot-extension-path = "${spring-boot-extension}/share/vscode/extensions/vmware.vscode-spring-boot";
in
{

  config.programs.nixvim.plugins = {
    spring-boot = {
      enable = true;
      settings = {
        ls_path = "${spring-boot-extension-path}/language-server/spring-boot-language-server-2.4.0-SNAPSHOT-exec.jar";
      };
    };

    jdtls.settings = {
      filetypes = [
        "java"
        "jproperties"
      ];

      init_options = {
        bundles.__raw = "require('spring_boot').java_extensions('${spring-boot-extension-path}/jars')";
      };
    };
  };
}
