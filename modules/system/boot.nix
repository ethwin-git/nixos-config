{
  flake.modules.nixos.boot = { pkgs, ... }: {
    boot.loader = {
    limine = {
      enable = true;
      secureBoot.enable = true;
      extraEntries = ''
      /Windows
        protocol: efi
        path: uuid(97e960b2-e6fe-4d9f-954a-7cf2150b163d):/EFI/Microsoft/Boot/bootmgfw.efi
    '';
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/efi";
      };
    };
    environment.systemPackages = [ pkgs.sbctl ];
  };
}
