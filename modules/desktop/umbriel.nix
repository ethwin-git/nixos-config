{inputs, ... }: {
  
  flake.modules.nixos.umbriel = {
    imports = [ inputs.umbriel.nixosModules.default ];

    programs.umbriel.enable = true;

    boot.extraModprobeConfig = ''
      options hid_apple fnmode=2
      '';
  };

  flake.modules.homeManager.umbriel = {
    imports = [ inputs.umbriel.homeModules.default ];

    programs.umbriel = {
      enable = true;
      settings = {
        general = {
          autostart = [ "noctalia" ];
          xwayland = true;
          xwayland_native_resolution = true;
          show_cheatsheet = false;
          
          };
        layout = {
          mode = "scrolling"; 
          gap = 5;
          extent_presets = [ 0.5 0.97 ];
          };

        appearance.blur = {
          enabled = true;
          optimized = true;
          radius = 6;
          passes = 4;
          saturation = 1.1;
          noise = 0.02;
          brightness = 1;
          contrast = 1;
        };

        window_rule = [
          {
            opacity = 0.9;
            blur = true;
          }
          {
            match.app_id = "^kitty$";
            blur = false;
          }
          {
            match.app_id = "^equibop$";
            default_output = "DP-1";
          }
        ];

        keybinds = {
          "Mod+Return" = "spawn kitty";
          "Mod+CTRL+C" = "window-close";
          "Mod+SPACE" = "spawn noctalia msg panel-toggle launcher";
          "Mod+B" = "spawn zen-beta";
          "Mod+Tab" = "overview-toggle";

          "Mod+V" = "window-toggle-floating";
          "Mod+E" = "window-toggle-fullscreen";

          "Mod+MouseMiddle" = "layout-scroll-drag";
          "Mod+MouseForward" = "workspace-previous";
          "Mod+MouseBack" = "workspace-next";

          "Mod+H" = "window-focus-left";
          "Mod+J" = "window-focus-down";
          "Mod+K" = "window-focus-up";
          "Mod+L" = "window-focus-right";
          "Mod+Left" = "window-focus-left";
          "Mod+Down" = "window-focus-down";
          "Mod+Up" = "window-focus-up";
          "Mod+Right" = "window-focus-right";

          "Mod+Shift+Right" = "window-move-to-output-right";
          "Mod+Shift+Left" = "window-move-to-output-left";
          "Mod+S" = "window-cycle-primary-extent";

          "Mod+Shift+Comma" = "column-move-left";
          "Mod+Shift+Period" = "column-move-right";

          "Mod+KP_Multiply" = "spawn noctalia msg screenshot-region --no-save-to-file";
          "Mod+Shift+S" = "spawn noctalia msg screenshot-region";

          "Mod+1" = "workspace-switch 1";          
          "Mod+2" = "workspace-switch 2";
          "Mod+3" = "workspace-switch 3";
          "Mod+4" = "workspace-switch 4";
          "Mod+5" = "workspace-switch 5";
          "Mod+6" = "workspace-switch 6";
          "Mod+7" = "workspace-switch 7";
          "Mod+8" = "workspace-switch 8";
          "Mod+9" = "workspace-switch 9";
          "Mod+0" = "workspace-switch 10";

          "Mod+Shift+1" = "window-move-to-workspace 1";
          "Mod+Shift+2" = "window-move-to-workspace 2";
          "Mod+Shift+3" = "window-move-to-workspace 3";
          "Mod+Shift+4" = "window-move-to-workspace 4";
          "Mod+Shift+5" = "window-move-to-workspace 5";
          "Mod+Shift+6" = "window-move-to-workspace 6";
          "Mod+Shift+7" = "window-move-to-workspace 7";
          "Mod+Shift+8" = "window-move-to-workspace 8";
          "Mod+Shift+9" = "window-move-to-workspace 9";
          "Mod+Shift+0" = "window-move-to-workspace 10";
        };

        output.DP-2 = {
          mode = "3840x2160@144";
          position = [0 0];
          scale = 2;
          focus_at_startup = true;
          vrr = "always";
        };

        output.DP-1 = {
          mode = "1920x1080@165";
          position = [1920 0];
          scale = 1;
        };

        input.keyboard = {
          numlock_toggle = true;
        };

        input.mouse = {
          sensitivity = -0.15;
          accel_profile = "flat";
        };

        input.focus = {
          follows_mouse = false;
        };

        layout.scrolling = {
          center_focused = "on_overflow";
        };
        
        };
      };
    };
  }

