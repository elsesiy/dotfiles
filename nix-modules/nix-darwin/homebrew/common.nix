{
  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    # updates homebrew packages on activation,
    # can make darwin-rebuild much slower (otherwise i'd forget to do it ever though)
    casks = [
      "ferdium"
      "uhk-agent"
      "wezterm" # nixpkg fails to build on x86
    ];
  };
}
