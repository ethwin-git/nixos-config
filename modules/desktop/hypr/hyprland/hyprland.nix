{
  flake.modules.homeManager.hyprland = {  

        wayland.windowManager.hyprland = {
          enable = true;
          configType = "lua";

          extraConfig = builtins.readFile ./hyprland.lua;
          };

        xdg.configFile."hypr/hyprland_sources".source = ./hyprland_sources;
        };
      }
