{
  homebrew = {
    brews = [
      "node@24"
    ];
    casks = [
      "ferdium"
      "ghostty" # nixpks broken
      "uhk-agent" # nixpks doesn't support arm
    ];
    enable = true;
    # updates homebrew packages on activation,
    # can make darwin-rebuild much slower (otherwise i'd forget to do it ever though)
    onActivation.autoUpdate = true;
  };
}
