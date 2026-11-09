{ inputs, ... }: {
  flake.modules.homeManager.elite-dangerous = { pkgs, ... }: {
    home.packages = with pkgs; [
      min-ed-launcher #Steam Launch Options: MinEdLauncher %command% /edo /autorun /autoquit
      edhm-ui
      edmarketconnector
    ];

    home.file.".config/min-ed-launcher/settings.json".text = ''
      {
    "apiUri": "https://api.zaonce.net",
    "watchForCrashes": false,
    "language": null,
    "autoUpdate": true,
    "checkForLauncherUpdates": true,
    "maxConcurrentDownloads": 4,
    "forceUpdate": [],
    "processes": [ { "fileName": "edmarketconnector" } ],
    "shutdownProcesses": [],
    "filterOverrides": [
    { "sku": "FORC-FDEV-DO-1000", "filter": "edo" },
    { "sku": "FORC-FDEV-DO-38-IN-40", "filter": "edh4" }
    ],
    "additionalProducts": []
      }
    '';
  };
}
