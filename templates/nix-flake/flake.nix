{
  description = ''
    Flake for {{ name }}

    {{ description | indent }}
  '';

{%- if "nix-devenv" in templates or "nix-all" in templates %}
  # Devenv Cachix
  nixConfig = {
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };
{%- endif %}

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
{%- if "nix-devenv" in templates or "nix-all" in templates %}
    # Devenv to automate development environment combined with direnv
    devenv = {
      url = "github:cachix/devenv";
    };
{%- endif %}
    alejandra = {
      url = "github:kamadorueda/alejandra/3.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # BEGIN DOTGIT-SYNC BLOCK EXCLUDED NIX_FLAKE_INPUT

    # END DOTGIT-SYNC BLOCK EXCLUDED NIX_FLAKE_INPUT
  };

  outputs = inputs @ {
    self,
    ...
  }: let
    pkgsForSystem = system:
      import inputs.nixpkgs {
        inherit system;
      };

    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = inputs.nixpkgs.lib.genAttrs allSystems;

    allSystems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];

    # BEGIN DOTGIT-SYNC BLOCK EXCLUDED NIX_FLAKE_CUSTOM_VARS

    # END DOTGIT-SYNC BLOCK EXCLUDED NIX_FLAKE_CUSTOM_VARS
{%- if "nix-devenv" in templates or "nix-all" in templates %}
  in
    inputs.utils.lib.eachSystem allSystems (
      system: let
        pkgs = pkgsForSystem system;
      in rec {
        packages = {
          devenv-up = self.devShells.${system}.default.config.procfileScript;
        };

        devShells = {
          default = inputs.devenv.lib.mkShell {
            inherit inputs pkgs;
            modules = [
              ./devenv.nix
            ];
          };
        };
      }
    )
  // {
{%- else %}
  in {
{%- endif %}
    # TOOLING
    # ========================================================================
    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (
      system:
        inputs.alejandra.defaultPackage.${system}
    );
{%- if "nix-home-manager-module" in templates or "nix-all" in templates %}
    homeManagerModules = {
      {{ slug }} = import ./modules/home-manager.nix self;
    };
    homeManagerModule = self.homeManagerModules.{{ slug }};
{%- endif %}

    # BEGIN DOTGIT-SYNC BLOCK EXCLUDED NIX_FLAKE_OUTPUTS_CUSTOM
    # Exemple of package
    overlays.default = final: prev: {
      {{ slug }} = final.callPackage ./package.nix {};
    };
    packages = forAllSystems (system: rec {
      {{ slug }} = with import inputs.nixpkgs {inherit system;};
        callPackage ./package.nix {};
      default = {{ slug }};
    });
    # END DOTGIT-SYNC BLOCK EXCLUDED NIX_FLAKE_OUTPUTS_CUSTOM
  };
}
