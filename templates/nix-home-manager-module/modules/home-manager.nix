self: {
  pkgs,
  lib,
  config,
  # BEGIN DOTGIT-SYNC BLOCK EXCLUDED NIX_HOME_MANAGER_MODULE_CUSTOM
  ...
}: let
  cfg = config.{{ slug }};
in
{
  # TODO: Update hm module, below is exemple for enbale options
  # options = {
  #   {{ slug }} = {
  #     enable = lib.mkEnableOption "TODO: Update description:";
  #   };
  # };

  # config = lib.mkIf cfg.enable {
  # TODO: Update hm module, below is exemple for a package
  #   home = {
  #     packages = [
  #       self.packages.${pkgs.stdenv.hostPlatform.system}.default
  #     ];
  #   };
  # TODO: Update hm module, below is exemple for dotfiles
  #   xdg = {
  #     configFile = {
  #       {{ slug }} = {
  #         source = lib.mkDefault self.packages.${pkgs.stdenv.hostPlatform.system}.default;
  #       };
  #     };
  #   };
  # };
  # TODO: Update hm module, below is exemple for dotfiles
  # END DOTGIT-SYNC BLOCK EXCLUDED NIX_HOME_MANAGER_MODULE_CUSTOM
}
