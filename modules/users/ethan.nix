{ config, ... }:
let
  hmModules = config.flake.modules.homeManager;
  nixos = config.flake.modules.nixos;
in

{
  flake.modules.nixos.ethan = { pkgs, ... }: {
    imports = [ nixos.steam ];
    
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
        hmModules.helix
        hmModules.zsh
        hmModules.fastfetch
        hmModules.kitty
        hmModules.ohmyposh
        hmModules.pwvucontrol
        hmModules.ssh
        hmModules.zen-browser
        hmModules.noctalia
      ];
    };
  };
}
