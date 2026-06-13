{ ... }: {
  programs.firefox.profiles.toepper.bookmarks.settings = [
    {
      name = "GitHub";
      url = "https://github.com/";
    }   
  ];
}
