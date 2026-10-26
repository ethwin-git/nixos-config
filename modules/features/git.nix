{
  flake.modules.homeManager.git = { pkgs, ... }: {  
    home.packages = [ pkgs.lazygit ];

        programs.git = {
          enable = true;
        settings.user = {
              name = "Ethwin";
              email = "217999545+ethwin-git@users.noreply.github.com";
           };
         };
       };
     }
