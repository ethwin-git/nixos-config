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
      nixos.helix
      nixos.zsh
      nixos.boot
      nixos.audio
      nixos.fonts
      nixos.nix
      nixos.networking
      nixos.noctalia-greeter
      nixos.umbriel
      nixos.nix-ld
    ];

        networking.hostName = "Daisy";
        time.timeZone = "America/New_York";
        system.stateVersion = "26.05";

        nixpkgs.hostPlatform = "x86_64-linux";     
        nixpkgs.config.allowUnfree = true;

        nixpkgs.overlays = [
          (final: prev: {
            stable = import inputs.nixpkgs-stable {
              system = final.stdenv.hostPlatform.system;
              config.allowUnfree = true;
            };
          })
        ];

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
     
        zramSwap = {
          enable = true;
          priority = 100;
          algorithm = "lz4";
          memoryPercent = 50;
        };
        
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
        };
      };    
    }
