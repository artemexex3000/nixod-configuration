{ pkgs, ... }:

{
  users.mutableUsers = false;
  users.defaultUserShell = pkgs.nushell;
}
