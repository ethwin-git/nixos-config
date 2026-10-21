{ config, pkgs, ... }: {
       programs.kitty = {
         enable = true;
         extraConfig = ''
           ${builtins.readFile ./kitty.conf}
           ${builtins.readFile ./current-theme.conf}
         '';
       };
 }
