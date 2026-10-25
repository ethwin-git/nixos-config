{ self, ... }: {
  
  flake.nixosModules.hardware-nvidia = { config, lib, pkgs, ... }: {
    options.hardware.nvidia.enable = lib.mkEnableOption "Nvidia drivers";

    config = lib.mkIf config.hardware.nvidia.enable {

        hardware.graphics.enable = true;
        services.xserver.videoDrivers = [ "nvidia" ];
        hardware.nvidia = {
          open = true;
          nvidiaSettings = true;
          modesetting.enable = true;
          };
         };
       };
     }
