{
  homebrew = {
    brews = [
      "bitwarden-cli"
    ];
    casks = [
      "1password"
      # "battery" broken on Tahoe, temp use https://github.com/js4jiang5/BatteryOptimizer_for_MAC instead
      "brave-browser"
      "cryptomator"
      "docker"
      "dropbox"
      "floorp"
      "keybase"
      "ledger-live" # x86_64-linux only
      "lm-studio" # nixpks broken, switch to ollama once mlx support lands https://github.com/ollama/ollama/pull/9118
      "macfuse"
      "rapidapi"
      "steam"
      "tuta-mail" # x86_64-linux only
    ];
  };
}
