{
  networking.useNetworkd = true;

  services.tailscale = {
    enable = true;
    extraDaemonFlags = [
      "--no-logs-no-support"
    ];
  };
}
