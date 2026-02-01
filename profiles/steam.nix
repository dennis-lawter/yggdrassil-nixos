{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;

  environment.systemPackages = with pkgs; [
    mangohud
    lutris
    protonup
    gamemode
  ];

  programs.gamemode.enable = true;
}
