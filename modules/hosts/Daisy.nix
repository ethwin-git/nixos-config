{ self, inputs, ... }: {
  flake.nixosConfigurations.Daisy = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    modules = [
      ../../configuration.nix
      inputs.home-manager.nixosModules.home-manager

      self.nixosModules.features-git
      self.nixosModules.user-ethan

      {
        nixpkgs.config.allowUnfree = true;
        
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
        };
      }
    ];
  };
}
