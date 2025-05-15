{
  networking.nftables.enable = true;
  networking.networkmanager.enable = true;
  systemd.network.wait-online.enable = false;
}
