{
	flake.modules.homeManager.waybar = { pkgs, ... }: {
		home.packages = [ pkgs.wttrbar ];
	programs.waybar.enable = true;
       
	xdg.configFile."waybar".source = ./waybar-config;
 };
}

