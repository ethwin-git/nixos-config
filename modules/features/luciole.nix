{ inputs, ... }: {
  
  flake.modules.nixos.luciole = {
    imports = [ inputs.luciole.nixosModules.default ];

    programs.luciole.enable = true;
    services.gvfs.enable = true;
  };
}
