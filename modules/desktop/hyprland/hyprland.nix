{
  flake.modules.nixos.hyprland = {
    programs.hyprland.enable = true;
  };
  
  flake.modules.homeManager.hyprland = { pkgs, ... }: {
    home.packages = [pkgs.hyprpicker ]; 

        wayland.windowManager.hyprland = {
          enable = true;
          configType = "lua";
          extraConfig = builtins.readFile ./hyprland.lua;
          };
        xdg.configFile."hypr/hyprland_sources".source = ./hyprland_sources;
        programs.hyprshot.enable = true;
        };
      }
