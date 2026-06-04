{
  description = "My custom workspace configured via nix-darwin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nix-darwin, home-manager, ... } @ inputs: {
    darwinConfigurations = builtins.listToAttrs (map (module: {
      name = module;
      value = nix-darwin.lib.darwinSystem {
        modules = [
          ./modules/base
          (./modules + "/${module}")
          home-manager.darwinModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
            };
          }
        ];
      };
    }) [ "private" "work" ]);
  };
}
