{ config, pkgs, ... }: {
  home.packages = [
    pkgs.pwvucontrol
  ];
}
