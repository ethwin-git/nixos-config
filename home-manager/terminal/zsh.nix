{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable= true;
    syntaxHighlighting.enable = true;
    completionInit = ''
      autoload -Uz compinit
      compinit
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
      zstyle ':completion:*' menu select
    '';
      initContent = ''
      setopt MENU_COMPLETE
      setopt GLOBDOTS
      bindkey '^[[Z' reverse-menu-complete
    '';

    shellAliases = {
      ls = "ls --color=auto";
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
