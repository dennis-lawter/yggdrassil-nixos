{ config, pkgs, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = false; # set true only if you explicitly want open kernel module
    nvidiaSettings = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };
}
