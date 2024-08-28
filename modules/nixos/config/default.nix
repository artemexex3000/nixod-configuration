{ pkgs, ... }:

{
  programs = {
    fish.enable = true;
    light.enable = true;
  };

  users.mutableUsers = false;
  users.users.artemexex3000 = {
    shell = pkgs.fish;
    extraGroups = [ "videos" ];
  };

  #services = {
  #  tlp.enable = true;
  #};

  #security.polkit.enable = true;
}
