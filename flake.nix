{
  description = "My custom workspace configured via nix-darwin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs =
    {
      nix-darwin,
      home-manager,
      nixvim,
      ...
    }:
    {
      darwinConfigurations = builtins.listToAttrs (
        map
          (module: {
            name = module;
            value = nix-darwin.lib.darwinSystem {
              modules = [
                ./modules/base
                (./modules + "/${module}")
                home-manager.darwinModules.home-manager
                {
                  home-manager = {
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    backupFileExtension = "backup";
                    extraSpecialArgs = { inherit nixvim; };
                  };
                }
              ];
            };
          })
          [
            "private"
            "work"
          ]
      );
    };
}
