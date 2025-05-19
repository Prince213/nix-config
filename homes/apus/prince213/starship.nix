{
  programs.starship = {
    enable = true;
    settings = {
      format = ''
        $directory$git_branch$git_commit$git_metrics$time$line_break$jobs$character
      '';
      git_metrics = {
        disabled = false;
      };
      time = {
        disabled = false;
      };
    };
  };
}
