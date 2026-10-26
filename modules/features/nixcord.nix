{ inputs, ... }: {

  flake.modules.homeManager.nixcord = {
  imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;
    discord.vencord.enable = true;

    #config.plugins = {
      #accountPanelServerProfile = true;
      #anonymiseFileNames = true;
      #betterFolders = true;
      #betterSettings = true;
      #biggerStreamPreview = true;
      #crashHandler = true;
      #expressionCloner = true;
      #fakeNitro = true;
      #notificationVolume = true;
      #spotifyCrack = true;
      #unlockedAvatarZoom = true;
      #volumeBooster = true;
      #youtubeAdblock = true;
      #};
    };
  };
}
