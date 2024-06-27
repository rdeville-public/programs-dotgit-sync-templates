# BEGIN DOTGIT-SYNC BLOCK MANAGED
{stdenv, ...}:
stdenv.mkDerivation {
  name = "dotgit-sync-templates";
  src = ./.;
# BEGIN DOTGIT-SYNC BLOCK EXCLUDED NIX_PACKAGES_PHASES
  installPhase = ''
    mkdir $out;
    cp -r \
      README.md \
      LICENSE* \
      CHANGELOG.md \
      CODE_OF_CONDUCT.md \
      AUTHORS \
      statics \
      templates \
      $out
  '';
# END DOTGIT-SYNC BLOCK EXCLUDED NIX_PACKAGES_PHASES
}
# END DOTGIT-SYNC BLOCK MANAGED
