{
  homebrew = {
    brews = [
      "node@24"
      "sst/tap/opencode"
    ];
    casks = [
      "ferdium"
      "ghostty" # nixpks broken
      "lm-studio" # nixpks broken, switch to ollama once mlx support lands https://github.com/ollama/ollama/pull/9118
      "uhk-agent" # nixpks doesn't support arm
    ];
    taps = [
      "sst/homebrew-tap"
    ];
    enable = true;
    # updates homebrew packages on activation,
    # can make darwin-rebuild much slower (otherwise i'd forget to do it ever though)
    onActivation.autoUpdate = true;
  };
}
