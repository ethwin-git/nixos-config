{
  flake.modules.homeManager.vesktop = { pkgs, ... }: {  

        programs.vesktop = {
          enable = true;
          settings = {
            tray = true;
            checkUpdates = false;
            minimizeToTray = true;
            hardwareAcceleration = true;
         };
       };
     };
   }
