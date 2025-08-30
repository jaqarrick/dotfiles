# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./private.nix
	./plex.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = ["lvm2"];

  networking.hostName = "takver"; # Define your hostname.
  

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  services.fail2ban.enable = true;


  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;


	virtualisation.docker = {
		enable = true;
		rootless = {
			enable = true;
			setSocketVariable = true;
		};
	};


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.admin = {
     isNormalUser = true;
     extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
	openssh.authorizedKeys.keys = [
		"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCzDXljz+SyIcpXHSxxlTpTmWQB7Rae+I+/G06jY0C8aRkt46aVjRiIqV6ehN6z8NhvJMRLkGikWFQyfZrNicWNXAMCRdA0k50F7n4S62qEYZj+OXF7KOks17pmBs6jD/eMtL2HtbXK9hjIX+Ggh4+dtlQ9HgmG//sQQtF+0LgpVNXcT47+fnWS7lhWjUzpnmbQlkjX8Sk9Z+3VyUVJU4N1N8eGiamzHqR6C8KqPrXccwKcGDZiqRDyw7O/NkPd3/vpyiGwOWblHCXysPK5gmQUzj+rdsmhOwbFrYUEXqUKSthrthaqdiO+4YuVP7SY3vvwWToAC+ENQAyiZvu+pvIGqhCev33QW/+Op2tMnkSzzagkXTgfFVU7lzTBzmuVa6ESo0cAURH7TgPpZdRXQjEVrpAZ3ngEybILWX+qlyPitmvynhosWTY/1kDleatsxBmy0U/9aDosqozsvuZU8TkkfyCtc8FuC1v+Jq7X0K3M8K5uJF65urIpMw1nebzZaok="
	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII3ifkHbZDZA5ZVpZuSKr4FtgKH47nOfsqKe5XJjYI5s mouse@mouse-pad"
	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEeyJnQtkenEbYISBJmjAT4EGUZeATlvra1byWenkvcb anarres@orbit"
	];
   };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.guest = {
     isNormalUser = true;
	openssh.authorizedKeys.keys = [
		"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCzDXljz+SyIcpXHSxxlTpTmWQB7Rae+I+/G06jY0C8aRkt46aVjRiIqV6ehN6z8NhvJMRLkGikWFQyfZrNicWNXAMCRdA0k50F7n4S62qEYZj+OXF7KOks17pmBs6jD/eMtL2HtbXK9hjIX+Ggh4+dtlQ9HgmG//sQQtF+0LgpVNXcT47+fnWS7lhWjUzpnmbQlkjX8Sk9Z+3VyUVJU4N1N8eGiamzHqR6C8KqPrXccwKcGDZiqRDyw7O/NkPd3/vpyiGwOWblHCXysPK5gmQUzj+rdsmhOwbFrYUEXqUKSthrthaqdiO+4YuVP7SY3vvwWToAC+ENQAyiZvu+pvIGqhCev33QW/+Op2tMnkSzzagkXTgfFVU7lzTBzmuVa6ESo0cAURH7TgPpZdRXQjEVrpAZ3ngEybILWX+qlyPitmvynhosWTY/1kDleatsxBmy0U/9aDosqozsvuZU8TkkfyCtc8FuC1v+Jq7X0K3M8K5uJF65urIpMw1nebzZaok="
	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII3ifkHbZDZA5ZVpZuSKr4FtgKH47nOfsqKe5XJjYI5s mouse@mouse-pad"
	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIvIYmiwjF6C+amr5CO/SxCe148uT/GUUnQPoWcY+8RW root@sloth"
	];
   };
  # programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     file
   ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
	enable = true;
	settings = {
			PasswordAuthentication = false;
			PermitRootLogin = "no";
	};
};

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall = {
	enable = true;
	allowedTCPPorts = [ 32400 ];
};

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = false;

  system.autoUpgrade = {
  	enable = true;
	flake = "/etc/nixos#takver";
  };
  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

