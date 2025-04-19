{
  home-manager = {
    useUserPackages = true;
    users.prince213 = {
      imports = [ ./prince213 ];
    };
  };
}
