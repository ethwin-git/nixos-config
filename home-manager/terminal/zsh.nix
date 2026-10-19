{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable= true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls = "ls --color=auto";
      hms = "home-manager switch --flake ~/nixos-config/#ethan";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-config/#Daisy";
      
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
   };

  home.sessionVariables = {
    EDITOR = "hx";
  };
}
