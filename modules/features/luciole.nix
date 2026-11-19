{ inputs, ... }: {
  
  flake.modules.homeManager.luciole = {
    imports = [ inputs.luciole.homeModules.default ];

    programs.luciole = {
      enable = true;
    };
  };
}
