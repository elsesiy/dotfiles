{
  homebrew = {
    brews = [
      "bitwarden-cli"
      "anomalyco/tap/opencode"
      "jundot/omlx/omlx"
    ];
    casks = [
      "1password"
      # "battery" broken on Tahoe, temp use https://github.com/js4jiang5/BatteryOptimizer_for_MAC instead
      "brave-browser"
      "cryptomator"
      "docker-desktop"
      "dropbox"
      "filen"
      "floorp"
      "keybase"
      "ledger-wallet" # x86_64-linux only
      "macfuse"
      "rapidapi"
      "steam"
    ];
    taps = [
      "anomalyco/tap"
      {
        name = "jundot/omlx";
        clone_target = "https://github.com/jundot/omlx";
      }
    ];
  };
}
