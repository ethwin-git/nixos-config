{ self, inputs, ... }: {
  flake.nixosConfigurations.Daisy = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    modules = [
      ../../configuration.nix
      inputs.home-manager.nixosModules.home-manager

      self.nixosModules.features-git
      self.nixosModules.user-ethan
      self.nixosModules.hardware-nvidia
      self.nixosModules.hardware-amd-cpu

      {
        nixpkgs.config.allowUnfree = true;

        hardware.nvidia.enable = true;
        hardware.cpu.amd.enable = true;
        
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
        };
      }
    ];
  };
}
