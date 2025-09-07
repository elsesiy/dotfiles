{
  homebrew = {
    brews = [
      "bitwarden-cli"
    ];
    casks = [
      "1password"
      "battery"
      "brave-browser"
      "cryptomator"
      "dropbox"
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
