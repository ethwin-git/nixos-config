{ config, pkgs, ... }: {
	
	programs.cava = {
	   enable = true;
	   settings = {
             general = {
              framerate = 60;
              autosens = 1;
              bars = 28;
              lower_cutoff_freq = 50;
              higher_cutoff_freq = 10000;
              hide_on_silence = false;
          };
             input = {
               method = "pulse";
               source = "auto";
          };
             output = {
               stereo = true;
               reverse = false;
               monstercat = false;
               waves = false;
               noise_reduction = "0.77";
      };
    };
  };
}
