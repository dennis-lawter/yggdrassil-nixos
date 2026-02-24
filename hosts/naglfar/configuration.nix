{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../../profiles/base.nix
      ../../profiles/bootloader.nix
      ../../profiles/global-packages.nix

      ../../profiles/de/locale.nix
      ../../profiles/de/i3wm+gdm.nix

      ../../profiles/dev/docker.nix

      ../../users/bytomancer.nix
    ];

  networking.hostName = "Naglfar";

  environment.pathsToLink = [ "/libexec" ];

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

  services.pulseaudio.enable = false;
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

  system.stateVersion = "25.05";
}
