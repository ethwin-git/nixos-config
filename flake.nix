{
  description = "Home Manager and System";

  inputs = {  
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
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

           home-manager.nixosModules.home-manager

           {
             home-manager.useGlobalPkgs = true;
             home-manager.useUserPackages = true;
             home-manager.users.ethan = import ./home-manager/home.nix;
           }
         ];
       };      
    };
}
