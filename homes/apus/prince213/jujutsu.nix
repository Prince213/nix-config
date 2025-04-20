{
  programs.jujutsu = {
    enable = true;
    settings = {
      ui = {
        show-cryptographic-signatures = true;
      };
      signing = {
        behavior = "own";
        backend = "gpg";
      };
    };
  };
}
