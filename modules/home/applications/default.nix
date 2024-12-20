{ pkgs, lib, ... }: let
  wrapped-phpstorm = pkgs.symlinkJoin {
    name = "phpstorm";
    paths = [pkgs.jetbrains.phpstorm];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/phpstorm \
        --prefix PATH : ${pkgs.nodejs_22}/bin
    '';
  };
in {
  home.packages = with pkgs; [
    neofetch
    wget
    inetutils
    gnumake
    htop
    lsof
    cloudflare-warp

    git
    ngrok
    ffmpeg_7-headless
    docker-compose
    filezilla
    php83Packages.composer
    php83Extensions.xdebug

    steam
    steam-run
    # qbittorrent
    vlc
    mkvtoolnix
    telegram-desktop
    postman
    wrapped-phpstorm
  ];

  programs = {
    neovim.enable = true;

    vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        rust-lang.rust-analyzer # rust-analyzer
	vadimcn.vscode-lldb # rust debugger
        tamasfe.even-better-toml # toml plagin
        bbenoist.nix # nix plagin
        k--kato.intellij-idea-keybindings # jetbrains keybindings
        mkhl.direnv # direnv plagin for vscode
      ];
      userSettings = {
        "editor.fontSize" = 16;
        "editor.fontFamily" = "'Jetbrains Mono', 'monospace', monospace";
	"editor.insertSpaces" = false;
	"editor.tabSize" = 4;

	"editor.mode" = "none";

        "termianl.integrated.fontSize" = 16;
	"terminal.integrated.fontFamily" = "'Jetbrains Mono', 'monospace', monospace";

        "files.autoSave" = "afterDelay";
        "window.titleBarStyle" = "custom";

	"lldb.suppressUpdateNotifications" = true;

	"rust-analyzer.inlayHints.lifetimeElisionHints.enable" = "always";
	"rust-analyzer.inlayHints.lifetimeElisionHints.useParameterNames" = true;
	"rust-analyzer.inlayHints.closureCaptureHints.enable" = true;
      };
    };

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
