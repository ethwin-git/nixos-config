{
  description = "Home Manager and System";

  inputs = {  
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      };

    import-tree = {
      url = "github:denful/import-tree";
      };
    };

  outputs =
    inputs@ {self, flake-parts, import-tree, ... }:
      flake-parts.lib.mkFlake { inherit inputs; } {

        imports = [
          (inputs.import-tree ./modules)

        ];

        flake = 
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
       nixosConfigurations.Daisy = inputs.nixpkgs.lib.nixosSystem {
         inherit system;

         modules = [
           { nixpkgs.pkgs = pkgs; }
           ./configuration.nix

           inputs.home-manager.nixosModules.home-manager

           self.nixosModules.features-git

           {
             home-manager.useGlobalPkgs = true;
             home-manager.useUserPackages = true;
             home-manager.backupFileExtension = "backup";
             home-manager.users.ethan = import ./home-manager/home.nix;

             features.git.enable = true;
           }
         ];
       };      
    };
  };
}
