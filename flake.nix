{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    flake-parts.url = "github:hercules-ci/flake-parts";
    secrets = {
      url = "git+file:///home/prince213/Documents/Projects/nix-secrets";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        nix-packages.follows = "nix-packages";
      };
    };
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.93.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-packages = {
      url = "sourcehut:~prince213/nix-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-topology = {
      url = "github:oddlama/nix-topology";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-parts,
      secrets,
      lix-module,
      nix-packages,
      disko,
      home-manager,
      neovim-nightly,
      nix-index-database,
      nix-topology,
      nixvim,
      plasma-manager,
      treefmt-nix,
      vscode-extensions,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [
        secrets.flakeModules.default
        nix-topology.flakeModule
        treefmt-nix.flakeModule
      ];
      flake = {
        homeModules.default = ./modules/home-manager;
        nixosConfigurations = {
          apus = nixpkgs.lib.nixosSystem {
            modules = [
              ./homes/apus
              ./systems/apus
              ./common/system
              secrets.nixosModules.apus
              {
                home-manager = {
                  extraSpecialArgs = {
                    inherit
                      nix-packages
                      neovim-nightly
                      vscode-extensions
                      ;
                  };
                  sharedModules = [
                    self.homeModules.default
                    nixvim.homeManagerModules.default
                    nix-index-database.hmModules.nix-index
                    plasma-manager.homeManagerModules.plasma-manager
                  ];
                };
              }
              # lix-module.nixosModules.default
              disko.nixosModules.default
              home-manager.nixosModules.default
              nix-topology.nixosModules.default
            ];
          };
          cetus = nixpkgs.lib.nixosSystem {
            modules = [
              ./systems/cetus
              ./common/system
              secrets.nixosModules.cetus
              disko.nixosModules.default
              nix-topology.nixosModules.default
            ];
          };
          draco = nixpkgs.lib.nixosSystem {
            modules = [
              ./systems/draco
              ./common/system
              secrets.nixosModules.draco
              disko.nixosModules.default
              nix-topology.nixosModules.default
            ];
          };
          nun = nixpkgs.lib.nixosSystem {
            modules = [
              ./systems/nun
              ./common/system
              secrets.nixosModules.nun
              disko.nixosModules.default
              nix-topology.nixosModules.default
            ];
          };
          orion = nixpkgs.lib.nixosSystem {
            modules = [
              ./systems/orion
              ./common/system
              secrets.nixosModules.orion
              disko.nixosModules.default
              nix-topology.nixosModules.default
            ];
          };
        };
      };
      perSystem = {
        topology = {
        };
        treefmt = {
          projectRootFile = "flake.nix";
          programs.nixfmt.enable = true;
        };
      };
    };
}
