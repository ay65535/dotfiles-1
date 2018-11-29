;; -*- lexical-binding: t -*-

(defun my//exec-path-from-shell-initialize ()
  (setq
   exec-path-from-shell-variables '("PATH"
                                    "MANPATH"
                                    "CARGO_HOME"
                                    "PYENV_ROOT"
                                    "RBENV_ROOT"
                                    "RUST_SRC_PATH")
   exec-path-from-shell-arguments '("-l"))
  (exec-path-from-shell-initialize))

(defun my//enable-frame-transparency (frame)
  (spacemacs/enable-transparency frame
                                 (cons dotspacemacs-active-transparency
                                       dotspacemacs-inactive-transparency)))

(defun my/init ()
  (setq
   ;; Emacs built-ins
   backup-inhibited t
   create-lockfiles nil
   dired-use-ls-dired nil
   fci-rule-color "#444444"
   require-final-newline t
   select-enable-clipboard nil

   ;; avy
   avy-timeout-seconds 0.0

   ;; cperl-mode
   cperl-mode-abbrev-table '()

   ;; evil-terminal-cursor-changer
   etcc-use-color dotspacemacs-colorize-cursor-according-to-state
   etcc-use-blink nil

   ;; helm
   helm-mini-default-sources '(helm-source-buffers-list)

   ;; magit
   magit-repolist-columns '(("Name" 25 magit-repolist-column-ident nil)
                            ("Version" 25 magit-repolist-column-version nil)
                            ("Path" 99 magit-repolist-column-path nil))
   magit-repository-directories (list (cons "~/.dotfiles" 0)
                                      (cons "~/.emacs.d" 0)
                                      (cons "~/.emacs.d/private/layers" 1)
                                      (cons "~/.emacs.d/private/local" 1)
                                      (cons "~/.config/fish/plugins" 1))

   ;; semantic
   semanticdb-find-default-throttle '(file local project unloaded system)

   ;; spacemacs-common
   spacemacs-theme-comment-italic t
   spacemacs-theme-underline-parens nil

   ;; yasnippet
   yas-indent-line 'fixed

   ;; yatemplate
   auto-insert-query nil
   auto-save-default nil))

(defun my/config ()
  ;; Copy environment variables from shell
  (if (eq window-system 'ns)
      (my//exec-path-from-shell-initialize))

  (require 'competitive-programming-snippets)
  (require 'flycheck-popup-tip)
  (require 'jest-snippets)
  (require 'react-snippets)
  (require 'redux-snippets)

  ;; Activate evil-terminal-cursor-changer
  (unless (display-graphic-p)
    (require 'evil-terminal-cursor-changer)
    (evil-terminal-cursor-changer-activate))

  ;; Fix frame transparency
  (my//enable-frame-transparency nil)
  (add-hook 'after-make-frame-functions #'my//enable-frame-transparency))
