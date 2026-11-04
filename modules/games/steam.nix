{
  flake.modules.nixos.steam = { pkgs, ... }: {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;

      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];

      extraPackages = with pkgs; [
        mangohud
      ];

      package = pkgs.steam.override {
        extraEnv = {
          MANGOHUD = "1";
          MANGOHUD_CONFIG = "fps,frametime,cpu_stats,cpu_temp,gpu_stats,gpu_temp,ram,vram,resolution,font_scale=2,toggle_hud=SHIFT+SHIFT_R+H";
        };
      };
    };
  };
}
