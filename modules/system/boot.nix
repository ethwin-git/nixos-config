{
  flake.modules.nixos.boot = { pkgs, ... }: {
    boot.loader = {
    limine = {
      enable = true;
      secureBoot.enable = true;
      maxGenerations = 5;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/efi";
      };
    };
    environment.systemPackages = [ pkgs.sbctl ];
  };
}
