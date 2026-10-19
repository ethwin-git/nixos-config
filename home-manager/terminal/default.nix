{ config, pkgs, ... }: {
  imports = [
    ./zsh.nix
    ./ohmyposh.nix
    ./kitty.nix
  ];
}
