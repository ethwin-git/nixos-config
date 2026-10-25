{ self, ... }: {
  
  flake.nixosModules.features-git = { config, lib, pkgs, ... }: {
    options.features.git.enable = lib.mkEnableOption "Dendritic Git and LazyGit configuration";

    config = lib.mkIf config.features.git.enable {
      home-manager.users.ethan = {
        home.packages = [ pkgs.lazygit ];

        programs.git = {
          enable = true;
        settings = {
            user = {
              name = "Ethwin";
              email = "217999545+ethwin-git@users.noreply.github.com";
           };
         };
       };
     };
   };
 };
}
