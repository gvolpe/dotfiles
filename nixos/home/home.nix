{ config, pkgs, ... }:

let
  dconfSettings = import ./dconf.nix;
in
{
  programs.home-manager.enable = true;

  imports = [
    ./programs/fish/default.nix
    ./programs/git/default.nix
    ./programs/neovim/default.nix
    ./programs/tmux/default.nix
  ];

  xdg.enable = true;

  home.packages = with pkgs; [
    cachix         # nix caching
    docker-compose # docker manager
    exa            # a better `ls`
    fd             # "find" for files
    ncdu           # disk space info (a better du)
    prettyping     # a nicer ping
    ripgrep        # fast grep
    rnix-lsp       # nix lsp server
    slack          # messaging client
    spotify        # music source
    tldr           # summary of a man page
    tree           # display files in a tree view

    # fonts
    (
      nerdfonts.override {
        fonts = [
          "AnonymousPro"
        ];
      }
    )

    # git stuff
    gitAndTools.diff-so-fancy # git diff with colors
    gitAndTools.tig # diff and commit view
  ];

  home = {
    username = "gvolpe";
    homeDirectory = "/home/gvolpe";
    stateVersion = "20.09";
  };

  # notifications about home-manager news
  news.display = "silent";

  # Gnome3 settings via dconf
  dconf.settings = dconfSettings;

  programs = {

    bat = {
      enable = true;
    };

    chromium = {
      enable = true;
      extensions = [
        "kklailfgofogmmdlhgmjgenehkjoioip" # google meet grid view
        "aapbdbdomjkkjkaonfhkkikfgjllcleb" # google translate
        "hdokiejnpimakedhajhdlcegeplioahd" # lastpass password manager
        "dbepggeogbaibhgnhhndojpepiihcmeb" # vimium
      ];
    };

    direnv = {
      enable = true;
      enableFishIntegration = true;
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    gpg = {
      enable = true;
    };

    htop = {
      enable = true;
      sortDescending = true;
      sortKey = "PERCENT_CPU";
    };

    jq = {
      enable = true;
    };

    #obs-studio = {
    #enable = true;
    #plugins = [];
    #};

    ssh = {
      enable = true;
    };

  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

}