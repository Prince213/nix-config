{
  networking.networkmanager.enable = true;
  systemd.network.wait-online.enable = false;

  services.tailscale.enable = true;
}
