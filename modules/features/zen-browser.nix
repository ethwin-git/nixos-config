{inputs, ... }: {
  flake.modules.homeManager.zen-browser = {
    imports = [ inputs.zen-browser.homeModules.beta ];
    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;
      profiles.ethan = {
      isDefault = true;

      settings = {
        "zen.view.use-single-toolbar" = false;

        "browser.toolbars.bookmarks.visibility" = "always";

        "zen.view.compact.enable-at-startup" = true;
        "zen.view.compact.should-enable-at-startup" = true;
        "zen.view.compact.hide-tabbar" = true;
        "zen.view.compact.hide-toolbar" = true;

        "zen.urlbar.behavior" = "float";
        "zen.view.show-newtab-button-top" = false;
        "zen.view.show-newtab-button-border-top" = true;
        "zen.view.window.scheme" = 0;
        "zen.workspaces.separate-essentials" = false;
        "zen.workspaces.show-workspace-indicator" = true;
        "zen.welcome-screen.seen" = true;
      };

      };
    };
  };
}
