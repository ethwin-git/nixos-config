{
  flake.modules.nixos.boot = { pkgs, ... }: {
    boot.loader = {
    limine = {
      enable = true;
      secureBoot.enable = true;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/efi";
      };
    };
    environment.systemPackages = [ pkgs.sbctl ];
  };
}
