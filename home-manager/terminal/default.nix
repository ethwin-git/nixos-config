{ config, pkgs, ... }: {
  imports = [
    ./zsh.nix
    ./ohmyposh/ohmyposh.nix
    ./kitty.nix
  ];
}
