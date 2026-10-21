{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader = {
    limine = {
      enable = true;
      secureBoot.enable = true;
      extraEntries = ''
      /Windows
        protocol: efi
        path: uuid(97e960b2-e6fe-4d9f-954a-7cf2150b163d): /EFI/Microsoft/Boot/bootmgfw.efi
    '';
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/efi";
    };
   };

  services.displayManager.ly.enable = true;

  networking.hostName = "Daisy"; # Define your hostname.

  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  
  programs.zsh.enable = true;
  users.users.ethan = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };
 
  programs.hyprland.enable = true;
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vis 
    kitty
    sbctl
    git
  ];

  fonts.packages = with pkgs; [
     noto-fonts
     noto-fonts-cjk-sans
     noto-fonts-cjk-serif
     noto-fonts-color-emoji
     nerd-fonts.iosevka
     nerd-fonts.jetbrains-mono
     font-awesome
];

 nix.gc = {
   automatic = true;
   dates = "weekly";
   options = "--delete-older-than 30d";
 };
 nix.settings.auto-optimise-store = true;
 

 hardware.cpu.amd.updateMicrocode = true;

 hardware.graphics.enable = true;
 services.xserver.videoDrivers = [ "nvidia" ];
 hardware.nvidia = {
 open = true;
 nvidiaSettings = true;
 modesetting.enable = true;
 };
 

 systemd.sleep.settings.Sleep= {
   AllowSuspend = "no";
   AllowHibernation = "no";
   AllowHybridSleep = "no";
   AllowSuspendThenHibernate ="no";
 };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";

}

