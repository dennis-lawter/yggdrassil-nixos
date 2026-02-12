{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    xivlauncher
    input-remapper
    dotnet-runtime_8
    wineWowPackages.stable
  ];

  programs.gamemode.enable = true;
}
