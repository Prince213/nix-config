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
      templates = {
        duplicate_description = ''
          concat(
            description,
            "(cherry picked from commit ",
            commit_id,
            ")",
          )
        '';
      };
    };
  };
}
