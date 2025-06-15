{
  homebrew = {
    brews = [
      "node@24"
    ];
    casks = [
      "ferdium"
    ];
    enable = true;
    # updates homebrew packages on activation,
    # can make darwin-rebuild much slower (otherwise i'd forget to do it ever though)
    onActivation.autoUpdate = true;
  };
}
