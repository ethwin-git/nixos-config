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
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."ethan" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home.nix ];
      };

       nixosConfigurations.Daisy = inputs.nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";

         modules = [
           ./configuration.nix
         ];
       };      
    };
}
