{
  flake.modules.homeManager.rofi = {
    
  programs.rofi.enable = true;
  xdg.configFile."rofi/config.rasi".source = ./config.rasi;
  };
}
