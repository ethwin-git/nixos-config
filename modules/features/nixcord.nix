{ inputs, ... }: {

  flake.modules.homeManager.nixcord = {
    imports = [ inputs.nixcord.homeModules.nixcord ];

    programs.nixcord = {
      enable = true;
      discord.enable = false;
      
      equibop = {
        enable = true;
        settings = {
          tray = true;
          checkUpdates = false;
          minimizeToTray = true;
          hardwareAcceleration = true;
        };
      };

        config.plugins = {
          accountPanelServerProfile.enable = true;
          anonymiseFileNames.enable = true;
          betterFolders = {
            enable = true;
            sidebar = true;
            sidebarAnim = true;
          };
          betterSettings.enable = true;
          biggerStreamPreview.enable = true;
          crashHandler.enable = true;
          expressionManager.enable = true;
          fakeNitro.enable = true;
          notificationVolume.enable = true;
          spotifyCrack.enable = true;
          unlockedAvatarZoom.enable = true;
          volumeBooster.enable = true;
          webKeybinds.enable = true;
          webScreenShareFixes.enable = true;
          youtubeAdblock.enable = true;
      };

      userPlugins = {
        wayAFKNext = "github:MuffinTastic/WayAFKNext/b3f98fe0f0109115a532c89e58b2260340916177";
      };
      extraConfig.plugins = {
        wayAFKNext.enable = true;
      };
    };
  };
}
