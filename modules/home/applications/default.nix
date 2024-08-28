{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neofetch
    wget
    gnumake
    htop

    git
    ngrok
    docker-compose
    php83Packages.composer

    qbittorrent
    vlc
    mkvtoolnix
    telegram-desktop
    postman
    jetbrains.phpstorm
  ];

  programs = {
    neovim.enable = true;
    firefox.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    btop.enable = true;
  };

  services = {
    ssh-agent.enable = true;
  };
}
