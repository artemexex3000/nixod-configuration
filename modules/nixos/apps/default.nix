{ pkgs, ... }:

{
  virtualisation = {
    docker.enable = true;
  };

  environment.systemPackages = with pkgs; [
    zig    
  ];

  #programs = {
  #  steam.enable = true;
  #};
}
