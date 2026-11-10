{
  flake.modules.nixos.zsh = {
    programs.zsh.enable = true;
    programs.zsh.enableGlobalCompInit = false;
  };
  
  flake.modules.homeManager.zsh = {
    programs.zsh.zprof.enable = false;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable= true;
    syntaxHighlighting.enable = true;
    completionInit = ''
      autoload -Uz compinit
      _zdumps=( ''${ZDOTDIR:-$HOME}/.zcompdump(N.mh+24) )
  if (( $#_zdumps )); then
      compinit
      touch "''${ZDOTDIR:-$HOME}/.zcompdump"
  else
      compinit -C
  fi
      unset _zdumps
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
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-config";
      lg = "lazygit";
      
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
   };

  home.sessionVariables = {
    EDITOR = "hx";
    };
  };
}
