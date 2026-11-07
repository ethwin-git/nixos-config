{
  flake.modules.nixos.helix = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.helix ];
  };
  flake.modules.homeManager.helix = {
    programs.helix = {
      enable = true;

      settings = {
        theme = "gruvbox_transparent";

        editor = {
          line-number = "relative";
          color-modes = true;

          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };

          soft-wrap.enable = true;
        };
      };

          themes = {
            gruvbox_transparent = {
              inherits = "gruvbox";
              "ui.background" = { };
          };
        };
      };
    };
  }
