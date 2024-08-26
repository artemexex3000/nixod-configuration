{ pkgs, ... }:

{
  programs.zsh.enable = true;

  users.mutableUsers = false;
  users.users.artemexex3000.shell = pkgs.zsh;
}
