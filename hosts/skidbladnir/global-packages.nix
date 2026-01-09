{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    zsh
    udisks
    udiskie
    gnome.gnome-disk-utility
    udevil
    gvfs
    rofi
    fw-ectool
    bluez-experimental
    blueman
    solaar
  ];
}
