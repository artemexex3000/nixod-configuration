{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-24.11";
    };

    snowfall = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs = { snowfall, ... } @ inputs:
    snowfall.mkFlake {
      inherit inputs;

      src = ./.;
      
      channels-config.allowUnfree = true;

      outputs-builder = channels: {
        formatter = channels.nixpkgs.alejandra;
      };
    };
}
