{ config, pkgs, ... }:

{
  imports = [
    ./terminal
    ./hypr
    ./ssh
    ./waybar
    ./swaync
    ./bibata-cursors
    ./pwvucontrol
    ./desktopBG
    ./texteditors
    ./rofi/rofi.nix
  ];
  
  home.username = "ethan";
  home.homeDirectory = "/home/ethan";

  home.stateVersion = "26.05";

  home.packages = [

  ];

  home.file = {
  
  };

  programs.home-manager.enable = true;

 
}
