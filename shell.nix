let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs {
    config = {allowUnfree = true;};
    overlays = [];
  };
in
  pkgs.mkShellNoCC {
    packages = with pkgs; [
      go
      python312Packages.python
      python312Packages.psycopg
      insomnia
    ];

    GREETING = "Garmin Podcast Server Development Shell!";
    shellHook = ''
      alias vim='nvim'
      echo $GREETING
    '';
  }
