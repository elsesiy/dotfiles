{
  homebrew = {
    casks = [
      "ferdium"
      "ghostty" # nixpks broken
      "uhk-agent" # nixpks doesn't support arm
      "tonisives/tap/ovim" # no nixpkg yet
    ];
    enable = true;
    # updates homebrew packages on activation,
    # can make darwin-rebuild much slower (otherwise i'd forget to do it ever though)
    onActivation.autoUpdate = true;
  };
}
