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
      imports = [
        ../../home-manager/home.nix
        hmModules.git
        hmModules.easyeffects
        hmModules.vesktop
        hmModules.hyprland
      ];
    };
  };
}
