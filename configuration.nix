{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  
  services.displayManager.ly.enable = true;

  networking.hostName = "Daisy"; # Define your hostname.

  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";


  

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  
 
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    git
  ];

  
 nix.gc = {
   automatic = true;
   dates = "weekly";
   options = "--delete-older-than 30d";
 };
 nix.settings.auto-optimise-store = true;

 
 systemd.sleep.settings.Sleep= {
   AllowSuspend = "no";
   AllowHibernation = "no";
   AllowHybridSleep = "no";
   AllowSuspendThenHibernate ="no";
 };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";

}

