{ config, ... }:
let
  hmModules = config.flake.modules.homeManager;
in

{
  flake.modules.nixos.ethan = { pkgs, ... }: {
    users.users.ethan = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.zsh;
      packages = with pkgs; [
        tree
      ];
    };

    home-manager.users.ethan = {
      home.stateVersion = "26.05";
      imports = [
        hmModules.git
        hmModules.easyeffects
        hmModules.vesktop
        hmModules.hyprland
        hmModules.bibata-cursors
        hmModules.rofi
        hmModules.awww-waypaper
        hmModules.waybar
        hmModules.swaync
        hmModules.helix
        hmModules.zsh
        hmModules.fastfetch
        hmModules.kitty
        hmModules.ohmyposh
        hmModules.pwvucontrol
        hmModules.ssh
      ];
    };
  };
}
