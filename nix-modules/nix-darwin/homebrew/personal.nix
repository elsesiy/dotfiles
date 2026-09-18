{
  homebrew = {
    brews = [
      "anomalyco/tap/opencode"
      "bitwarden-cli"
      "jundot/omlx/omlx"
    ];
    casks = [
      "1password"
      "battopt"
      "brave-browser"
      "cryptomator"
      "docker-desktop"
      "dropbox"
      "filen"
      "floorp"
      "fluidvoice"
      "keybase"
      "ledger-wallet" # x86_64-linux only
      "macfuse"
      "rapidapi"
      "sshfs-mac"
      "steam"
    ];
    taps = [
      "anomalyco/tap"
      "js4jiang5/homebrew-battopt"
      {
        name = "jundot/omlx";
        clone_target = "https://github.com/jundot/omlx";
      }
    ];
  };
}
