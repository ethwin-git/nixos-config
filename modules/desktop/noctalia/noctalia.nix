{
  flake.modules.homeManager.noctalia = {
    programs.noctalia = {
      enable = true;
      settings = ./config.toml;
    };
  };
}
