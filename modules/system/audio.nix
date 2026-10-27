{
  flake.modules.nixos.audio = {
    security.rtkit.enable = true;
  services = {
	  pulseaudio.enable = false;

	  pipewire = {
	    enable = true;
	    alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
      jack.enable = false;

    extraConfig.pipewire."92-low-latency" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 256;
        "default.clock.min-quantum" = 32;
        "default.clock.max-quantum" = 1024;
          };
        };
      };
    };
  };
}
