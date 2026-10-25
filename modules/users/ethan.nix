{ self, ... }: {
  flake.nixosModules.user-ethan = { config, pkgs, ... }: {
    users.users.ethan = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.zsh;
      packages = with pkgs; [
        tree
      ];
    };

    features.git.enable = true;

    home-manager.users.ethan = import ../../home-manager/home.nix;
  };
}
