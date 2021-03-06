      [
        (_: super:
          with super;
          let
            unstable = import <nixos-unstable> { inherit config; };
            python3Packages = (callPackage (import ./python3-packages.nix) { });
            rofiScripts = (callPackage (import ./rofi-scripts) { });
            tmuxPlugins = (callPackage (import ./tmux-plugins) { });
            vimPlugins = (callPackage (import ./vim-plugins.nix) { });
            vscode-extensions = (callPackage (import ./vscode-extensions.nix) { });
            zshPlugins = (callPackage (import ./zsh-plugins) { });
          in {
            inherit unstable;

            my = {
              inherit python3Packages rofiScripts tmuxPlugins vimPlugins
                vscode-extensions zshPlugins;

              alfred = callPackage ./alfred.nix { };
              corretto_11 = callPackage ./corretto_11.nix { };
              delta = callPackage ./delta.nix { };
              emacs = callPackage ./emacs.nix { emacs = unstable.emacs; };
              haskell-language-server = callPackage ./haskell-language-server.nix { };
              jenv = callPackage ./jenv.nix { };
              kotlin-language-server = callPackage ./kotlin-language-server.nix {
                gradle_6 = unstable.gradle;
              };
              notion = callPackage ./notion.nix { };
              operator-mono = callPackage ./operator-mono.nix { };
              protonvpn-cli-wrapper = callPackage ./protonvpn-cli-wrapper.nix {
                protonvpn-cli = python3Packages.protonvpn-cli;
              };
              zinit = callPackage ./zinit.nix { };
            };
          })
      ]
