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
      ../../configuration.nix
      inputs.home-manager.nixosModules.home-manager        
      nixos.ethan
      nixos.amd-cpu
      nixos.nvidia
      nixos.hyprland
      nixos.helix
      nixos.zsh
      nixos.boot
      nixos.audio
    ];

        nixpkgs.hostPlatform = "x86_64-linux";     
        nixpkgs.config.allowUnfree = true;
        
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
        };
      };    
    }
