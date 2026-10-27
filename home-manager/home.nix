{ config, pkgs, ... }:

{
  imports = [
    ./terminal
    ./ssh
    ./waybar
    ./swaync
    ./pwvucontrol
    ./texteditors
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
