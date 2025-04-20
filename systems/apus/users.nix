{ config, ... }:
{
  users.users.prince213 = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
    ];
    shell = config.programs.fish.package;
  };

  nix.settings.trusted-users = [ "prince213" ];
}
