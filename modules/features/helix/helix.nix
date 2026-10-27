{
  flake.modules.nixos.helix = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.helix ];
  };
  flake.modules.homeManager.helix = {
    xdg.configFile."helix/config.toml".source = ./config.toml;
    };
  }
