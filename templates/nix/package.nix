{stdenv, ...}:
stdenv.mkDerivation {
  name = "{{ extra.repo.slug }}";
  src = ./.;
# BEGIN DOTGIT-SYNC BLOCK EXCLUDED NIX_PACKAGES_PHASES
#   installPhase = ''
#     # TODO: Setup Install nix Packages Install Phase
#   '';
# END DOTGIT-SYNC BLOCK EXCLUDED NIX_PACKAGES_PHASES
}
