{
  flake.modules.homeManager.pwvucontrol = { pkgs, ... }: {
  home.packages = [
    pkgs.pwvucontrol
    ];
  };
}
