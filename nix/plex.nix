# /etc/nixos/plex.nix
{
  config,
  lib,
  pkgs,
  ...
}:

{
  # No return value here, this is a module that directly modifies the system config
  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      plex = {
        image = "plexinc/pms-docker:latest";
        autoStart = true;
        environment = {
          TZ = "America/New_York";
        };
        volumes = [
          "/media/config/plex/db:/config"
          "/media/config/plex/transcode:/transcode"
          "/media/library:/data"
        ];
        extraOptions = [
          "--network=host"
          "--name=takver-plex"
        ];
      };
    };
  };
  # Add this section to ensure network is ready before container starts
  systemd.services.docker-plex = {
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
  };
}
