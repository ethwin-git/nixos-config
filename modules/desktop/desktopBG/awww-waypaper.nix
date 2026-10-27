{
	flake.modules.homeManager.awww-waypaper = { pkgs, ... }: {
		home.packages = [ pkgs.waypaper ];
		services.awww.enable = true;
	};
}
