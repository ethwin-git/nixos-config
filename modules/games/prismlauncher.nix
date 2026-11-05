{
  flake.modules.homeManager.prismlauncher = { pkgs, ... }: {
    programs.prismlauncher = {
      enable = true;
      package = pkgs.prismlauncher.override {
        jdks = with pkgs; [ temurin-bin-25 ];
      }; 
    };
  };
}
