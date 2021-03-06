{ pkgs, ... }:

{
  my.userName = "sei40kr";
  my.userFullName = "Seong Yong-ju";
  my.userEmail = "sei40kr@gmail.com";

  my.user = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "video" "networkmanager" ];
    shell = pkgs.zsh;
  };

  modules = {
    desktop = {
      xmonad.enable = true;

      apps = {
        bitwarden.enable = true;
        cheese.enable = true;
        evince.enable = true;
        # geary.enable = true;
        gnomeBooks.enable = true;
        # gnomeCalendar.enable = true;
        # gnomeContacts.enable = true;
        gnomeFileRoller.enable = true;
        gnomeFontViewer.enable = true;
        gnomePomodoro.enable = true;
        nautilus.enable = true;

        slack.enable = true;
        rofi.enable = true;
        seahorse.enable = true;
      };

      browsers = {
        chromium.enable = true;
        firefox.enable = true;
        qutebrowser.enable = true;
      };

      config.gtk.keyTheme = "Mac";

      term.alacritty.enable = true;

      tools = {
        clipmenu.enable = true;
        randomBackground.enable = true;
        scrot.enable = true;
      };

      x11 = {
        startx = {
          enable = true;
          autorun = true;
        };
        xresources.enable = true;
      };

      i18n.japanese.enable = true;
    };

    media = {
      eog.enable = true;
      totem.enable = true;
    };

    dev = {
      editors = {
        emacs.enable = true;
        idea.enable = true;
        neovim.enable = true;
        vscodium.enable = true;
      };

      tools = {
        git = {
          enable = true;
          enableGitFlow = true;
          enableGitCrypt = true;
        };
        streamlit.enable = true;
        zeal.enable = true;

        # Infrastructure & CI Tools
        ansible.enable = true;
        awsCli.enable = true;
        awsShell.enable = true;
        datagrip.enable = true;
        dockerCompose.enable = true;
        googleCloudSdk.enable = true;
        circleciCli.enable = true;
        mycli.enable = true;
        pgcli.enable = true;
        travis.enable = true;
      };

      cc.enable = true;
      go.enable = true;
      groovy.enable = true;
      haskell.enable = true;
      java.enable = true;
      kotlin.enable = true;
      python.enable = true;
      r.enable = true;
      ruby = {
        enable = true;
        enableRails = true;
      };
      rust.enable = true;
      scala.enable = true;
      sh.enable = true;
      web.enable = true;
    };

    services = {
      cupsd.enable = true;
      docker = {
        enable = true;
        enableAutoPrune = true;
      };
      flexget.enable = true;
      fstrim.enable = true;
      jellyfin = {
        enable = true;
        openFirewall = true;
      };
      protonvpn.enable = true;
      psd.enable = true;
      rclone = {
        enable = true;
        enableGoogleDrive = true;
        enableGooglePhotos = true;
      };
      redshift.enable = true;
      sshd.enable = true;
      transmission.enable = true;
    };

    shell = {
      zsh.enable = true;
      tmux = {
        enable = true;
        autostart = true;
      };

      tools = {
        atcoderTools.enable = true;
        bat.enable = true;
        exa.enable = true;
        htop.enable = true;
        prettyping.enable = true;
        strace.enable = true;
        tcpdump.enable = true;
      };
    };

    # themes.kaguya.enable = true;
    themes.zelda.enable = true;
  };
}
