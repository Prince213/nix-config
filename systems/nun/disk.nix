{
  disko.devices.disk.main = {
    device = "/dev/vda";
    imageSize = "10G";
    content = {
      type = "gpt";
      partitions = {
        boot = {
          type = "EF02";
          size = "1M";
        };
        root = {
          type = "8304";
          size = "100%";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
          };
        };
      };
    };
  };
}
