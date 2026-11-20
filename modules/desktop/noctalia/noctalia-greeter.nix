{
  flake.modules.nixos.noctalia-greeter = { pkgs, ... }: {
      services.displayManager.noctalia-greeter = {
        enable = true;
        settings = {
          cursor.size = 24;
          
          output = {
            refresh_rate = "DP-2:144; DP-1:165";
        };          
      };
      cursorTheme = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
      };
      passwordlessSyncUsers = [ "ethan" ];
    };
  };
}
