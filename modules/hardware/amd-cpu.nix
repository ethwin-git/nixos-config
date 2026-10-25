{ self, ... }: {
  
  flake.nixosModules.hardware-amd-cpu = { config, lib, pkgs, ... }: {
    options.hardware.cpu.amd.enable = lib.mkEnableOption "AMD Microcode";

    config = lib.mkIf config.hardware.cpu.amd.enable {

     hardware.cpu.amd.updateMicrocode = true;
      };
    };
  }

