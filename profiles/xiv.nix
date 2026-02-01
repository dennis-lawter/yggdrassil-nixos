{ pkgs, ... }:

{
  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;

  environment.systemPackages = with pkgs; [
    xivlauncher
    input-remapper
    polychromatic
    openrazer-daemon
  ];

  programs.gamemode.enable = true;
}
