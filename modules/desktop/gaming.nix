{ config, pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.amdgpu.overdrive.enable = true;
  services.lact.enable = true;
  
  hardware.graphics.extraPackages = with pkgs; [
    vulkan-validation-layers
  ];

  hardware.graphics.extraPackages32 = with pkgs; [
    pkgs.pkgsi686Linux.vulkan-loader
  ];

  system.activationScripts.ldsoCache = ''
    mkdir -p /var/cache/ldconfig
    ${pkgs.glibc.bin}/bin/ldconfig -C /var/cache/ldconfig/ld.so.cache -f /dev/null \
      /run/opengl-driver/lib \
      /run/opengl-driver-32/lib
  '';
}
