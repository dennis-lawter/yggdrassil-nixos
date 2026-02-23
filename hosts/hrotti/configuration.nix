{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../../profiles/base.nix
      ../../profiles/bootloader.nix
      ../../profiles/global-packages.nix

      ../../profiles/de/locale.nix
      ../../profiles/de/gnome.nix

      ../../profiles/steam.nix
      ../../profiles/xiv.nix

      ../../profiles/hw/nvidia.nix

      ../../profiles/hw/audio.nix

      ../../users/bytomancer.nix
    ];

  networking.hostName = "Hrotti";

  environment.pathsToLink = [ "/libexec" ];

  services.udev.packages = with pkgs; [
    vial
    via
  ];

  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  system.stateVersion = "25.05";
}
