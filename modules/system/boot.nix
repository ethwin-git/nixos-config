{
  flake.modules.nixos.boot = { pkgs, ... }: {
    boot.loader = {
    limine = {
      enable = true;
      maxGenerations = 5;
      secureBoot = {
        enable = true;
        autoEnrollKeys = {
          enable = true;
          extraArgs = [ "--microsoft" "--firmware-builtin" ];
        };
      };
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/efi";
      };
    };
  };
}
