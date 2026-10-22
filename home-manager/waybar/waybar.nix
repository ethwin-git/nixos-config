{ config, pkgs, ... }: {
	
	programs.waybar.enable = true;
       
	xdg.configFile."waybar".source = ./waybar-config;

	home.packages = [ pkgs.wttrbar ];

}

