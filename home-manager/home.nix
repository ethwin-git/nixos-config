{ config, pkgs, ... }:

{
  imports = [
    ./ssh
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
