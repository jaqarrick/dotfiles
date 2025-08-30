{ config, pkgs, ... }:
{
  # Basic user info
  home.username = "admin";
  home.homeDirectory = "/home/admin";
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  imports = [
    ./vim.nix
  ];

  # User packages (moved from system config)
  home.packages = with pkgs; [
    git
    vim
    htop
    tree
    protonvpn-cli
    wget
    curl
    nmap
    tmux
    restic
    file
    ffmpeg
    yt-dlp
    nixfmt-rfc-style
  ];

  # Programs with configuration
  programs.git = {
    enable = true;
    userName = "Your Name"; # Update this
    userEmail = "your@email.com"; # Update this
  };

  # You might want to add tmux config too
  programs.tmux = {
    enable = true;
    # Add tmux configuration here if desired
  };
}
