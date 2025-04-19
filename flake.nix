{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      flake-parts,
      disko,
      home-manager,
      treefmt-nix,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [
        treefmt-nix.flakeModule
      ];
      flake.nixosConfigurations.apus = nixpkgs.lib.nixosSystem {
        modules = [
          ./systems/apus
          disko.nixosModules.default
          home-manager.nixosModules.default
        ];
      };
      perSystem = {
        treefmt = {
          projectRootFile = "flake.nix";
          programs.nixfmt.enable = true;
        };
      };
    };
}
