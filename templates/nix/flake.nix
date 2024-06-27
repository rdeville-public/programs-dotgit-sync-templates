{
  description = ''
    Flake for {{ name }}

    {{ description | indent }}
  '';

  nixConfig = {
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };

  inputs = {
    # Stable Nix Packages
    nixpkgs = {
      url = "nixpkgs/nixos-24.05";
      # url = "github:nixos/nixpkgs/nixos-unstable";
    };
    # Flake Utils Lib
    utils = {
      url = "github:numtide/flake-utils";
    };
    # Devenv to automate development environment combined with direnv
    devenv = {
      url = "github:cachix/devenv";
    };
    alejandra = {
      url = "github:kamadorueda/alejandra/3.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
# BEGIN DOTGIT-SYNC BLOCK EXCLUDED NIX_FLAKE_INPUT
#
# END DOTGIT-SYNC BLOCK EXCLUDED NIX_FLAKE_INPUT
  };

  outputs = inputs @ {
    self,
    devenv,
    utils,
    nixpkgs,
    alejandra,
# BEGIN DOTGIT-SYNC BLOCK EXCLUDED NIX_FLAKE_OUTPUTS_VARS
#
# END DOTGIT-SYNC BLOCK EXCLUDED NIX_FLAKE_OUTPUTS_VARS
    ...
  }: let
    pkgsForSystem = system:
      import nixpkgs {
        inherit system;
      };

    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs allSystems;

    allSystems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
  in
    utils.lib.eachSystem allSystems (
      system: let
        pkgs = pkgsForSystem system;
      in rec {
        packages = {
          devenv-up = self.devShells.${system}.default.config.procfileScript;
        };

        devShells = {
          default = devenv.lib.mkShell {
            inherit inputs pkgs;
            modules = [
              ./devenv.nix
            ];
          };
        };
      }
    )
    // {
      # TOOLING
      # ========================================================================
      # Formatter for your nix files, available through 'nix fmt'
      # Other options beside 'alejandra' include 'nixpkgs-fmt'
      formatter = forAllSystems (
        system:
          alejandra.defaultPackage.${system}
      );

      overlays.default = final: prev: {
        {{ extra.repo.slug }} = final.callPackage ./package.nix {};
      };
      packages = forAllSystems (system: rec {
        {{ extra.repo.slug }} = with import nixpkgs {inherit system;};
          callPackage ./package.nix {};
        default = {{ extra.repo.slug }};
      });

      homeManagerModules = {
        {{ extra.repo.slug }} = import ./modules/home-manager.nix self;
      };
      homeManagerModule = self.homeManagerModules.{{ extra.repo.slug }};

# BEGIN DOTGIT-SYNC BLOCK EXCLUDED NIX_FLAKE_OUTPUTS_CUSTOM
#
# END DOTGIT-SYNC BLOCK EXCLUDED NIX_FLAKE_OUTPUTS_CUSTOM
    };
}
