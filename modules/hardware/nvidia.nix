{  
  flake.modules.nixos.nvidia = { config, ... }: {
        hardware.graphics.enable = true;
        hardware.graphics.enable32Bit = true;
        services.xserver.videoDrivers = [ "nvidia" ];
        hardware.nvidia = {
          open = true;
          nvidiaSettings = true;
          modesetting.enable = true;
          package = config.boot.kernelPackages.nvidiaPackages.stable;
        };
    };
}
