{
  flake.modules.homeManager.ohmyposh = {
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromJSON (builtins.readFile ./ethwin.json);
    };
  };
}
