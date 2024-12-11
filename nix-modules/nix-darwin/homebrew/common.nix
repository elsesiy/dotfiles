{
  homebrew = {
    brews = [
      "node@22"
    ];
    casks = [
      "ferdium"
      "uhk-agent"
      "wezterm" # nixpkg fails to build on x86
      "wireshark" # nipkgs broken
    ];
    enable = true;
    # updates homebrew packages on activation,
    # can make darwin-rebuild much slower (otherwise i'd forget to do it ever though)
    onActivation.autoUpdate = true;
  };
}
