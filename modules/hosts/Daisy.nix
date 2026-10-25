{ self, inputs, ... }: {
  flake.nixosConfigurations.Daisy = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    modules = [
      ../../configuration.nix
      inputs.home-manager.nixosModules.home-manager
     ]
      ++ (with self.nixosModules; [
      features-git
      user-ethan
      hardware-nvidia
      hardware-amd-cpu
     ]) ++ [
     
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
