{ lib, pkgs, ... }:

{

  environment = {
    shells = [ pkgs.fish ];
  };

  programs = {
    bash.enable = true;
    fish.enable = true;
    zsh.enable = true;
  };

  system = {
    stateVersion = 5;
    # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
    # on nix-darwin only certain scripts are run, see https://github.com/LnL7/nix-darwin/issues/663
    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';
    activationScripts.keyboard.text = ''
      # remap capslock to backspace
      /usr/bin/hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x70000002A}]}'
    '';
    defaults = {
      ".GlobalPreferences"."com.apple.mouse.scaling" = 1.0;
      NSGlobalDomain = {
        AppleInterfaceStyle = lib.mkDefault "Dark";
        AppleShowAllExtensions = true;
        InitialKeyRepeat = 15; # default min is 15
        KeyRepeat = 1; # default min is 2
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
      };
      dock = {
        show-recents = false;
      };
      finder = {
        AppleShowAllFiles = true;
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle = "clmv";
        ShowPathbar = true;
        ShowStatusBar = true;
        _FXShowPosixPathInTitle = true;
      };
      trackpad = {
        TrackpadRightClick = true;
      };
      WindowManager = {
        EnableStandardClickToShowDesktop = false;
      };
    };
    startup.chime = false;
  };
  security.pam.enableSudoTouchIdAuth = true;

  nix.settings.sandbox = false;
  ids.gids.nixbld = 30000;

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit pkgs; };
}
