self: {
  pkgs,
  lib,
# BEGIN DOTGIT-SYNC BLOCK EXCLUDED NIX_HOME_MANAGER_MODULE_CUSTOM
  ...
}: {
  # TODO: Update hm module, below is exemple for dotfiles
  # xdg = {
  #   configFile = {
  #     {{ extra.repo.slug }} = {
  #       source = lib.mkDefault self.packages.${pkgs.stdenv.hostPlatform.system}.default;
  #     };
  #   };
  # };
# END DOTGIT-SYNC BLOCK EXCLUDED NIX_HOME_MANAGER_MODULE_CUSTOM
}
