{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "wanaxel";
        email = "wanaxel@proton.me";
      };

      init.defaultBranch = "main";
    };
  };
}
