{ inputs, config, ... }:

let
  nixos = config.flake.modules.nixos;
in
{     
  flake.nixosConfigurations.Daisy = inputs.nixpkgs.lib.nixosSystem {
    modules = [ nixos.Daisy ];
    };
    
  flake.modules.nixos.Daisy = {
    imports = [
      ./_hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager        
      nixos.ethan
      nixos.amd-cpu
      nixos.nvidia
      nixos.hyprland
      nixos.helix
      nixos.zsh
      nixos.boot
      nixos.audio
      nixos.fonts
      nixos.nix
      nixos.networking
      nixos.login
    ];

    programs.firefox.enable = true;

        networking.hostName = "Daisy";
        time.timeZone = "America/New_York";
        system.stateVersion = "26.05";

        nixpkgs.hostPlatform = "x86_64-linux";     
        nixpkgs.config.allowUnfree = true;

        boot.loader.limine.extraEntries = ''
          /Windows
            protocol: efi
            path: uuid(97e960b2-e6fe-4d9f-954a-7cf2150b163d):/EFI/Microsoft/Boot/bootmgfw.efi
      '';

        systemd.sleep.settings.Sleep= {
         AllowSuspend = "no";
         AllowHibernation = "no";
         AllowHybridSleep = "no";
         AllowSuspendThenHibernate ="no";
     };
        
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
        };
      };    
    }
