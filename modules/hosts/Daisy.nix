{ self, inputs, ... }:

let
  sharedModules = builtins.filter
  (name: builtins.match "user-.*" name == null)
  (builtins.attrNames self.nixosModules);
  in
   {
     
  flake.nixosConfigurations.Daisy = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    modules = [
      ../../configuration.nix
      inputs.home-manager.nixosModules.home-manager
     ]
      ++ map (name: builtins.getAttr name self.nixosModules)
        sharedModules
      ++ [
        
         self.nixosModules.user-ethan
             
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
