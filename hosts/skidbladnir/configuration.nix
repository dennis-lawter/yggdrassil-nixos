{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      ./global-packages.nix
      ./users/bytomancer.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Skidbladnir";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.pathsToLink = [ "/libexec" ];

  services.displayManager.defaultSession = "none+i3";
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
    };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks
     ];
    };
  };

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.udev.packages = with pkgs; [
    vial
    via
  ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.hardware.bolt.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.devmon.enable = true;
  services.printing.enable = true;

  virtualisation.docker.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  system.stateVersion = "24.05";
}
