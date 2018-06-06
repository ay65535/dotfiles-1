;;; funcs.el - custom layer file for Spacemacs
;;
;; Copyright (c) 2018 Seong Yong-ju
;;
;; Author: Seong Yong-ju <sei40kr@gmail.com>
;; URL: https://github.com/sei40kr/dotfiles
;;
;; This file is not part of GNU Emacs
;;
;;; License: MIT

(defun spacemacs/save-some-buffers ()
  (interactive)
  (save-some-buffers t))


;; evil-mc

(defun spacemacs//evil-mc-define-vars-after (&rest _)
  (push 'evil-escape-mode evil-mc-incompatible-minor-modes))

(defun spacemacs//evil-mc-make-cursor-at-col (col _ line-number)
  (move-to-column col)
  (unless (= (line-number-at-pos) line-number)
    (evil-mc-make-cursor-here)))

(defun spacemacs/evil-mc-make-and-goto-next-match ()
  (interactive)
  (require 'evil-mc)
  (turn-on-evil-mc-mode)
  (evil-mc-make-and-goto-next-match))

;; cf https://github.com/gabesoft/evil-mc/issues/22

(defun spacemacs/evil-mc-make-vertical-cursors (beginning end)
  (interactive (list (region-beginning) (region-end)))
  (require 'evil-mc)
  (turn-on-evil-mc-mode)
  (evil-mc-pause-cursors)
  (evil-apply-on-rectangle
    #'spacemacs//evil-mc-make-cursor-at-col
    beginning
    end
    (line-number-at-pos (point)))
  (evil-mc-resume-cursors)
  (evil-normal-state)
  (move-to-column (evil-mc-column-number (if (> end beginning) beginning end))))

(defun spacemacs/evil-mc-undo-all-cursors ()
  (interactive)
  (evil-mc-undo-all-cursors)
  (turn-off-evil-mc-mode))

;; ghq

(defun spacemacs/ghq ()
  (interactive)
  (let ((repository (read-string "Enter the repository: ")))
    (require 'ghq)
    (if (or
          (string-prefix-p "sei40kr/" repository t)
          (string-prefix-p "github.com/sei40kr/" repository t))
      (ghq--get-repository-ssh repository)
      (ghq--get-repository repository))))


;; js2-mode

(defun spacemacs//javascript-setup-checkers ()
  ;; Disable built-in checking
  (set (make-local-variable 'js2-mode-show-parse-errors) nil)
  (set (make-local-variable 'js2-mode-show-strict-warnings) nil)
  ;; Disable flycheck checkers
  (add-to-list 'flycheck-disabled-checkers 'javascript-jshint)
  (add-to-list 'flycheck-disabled-checkers 'javascript-standard))


;; projectile

(defun spacemacs//projectile-switch-project-action ()
  (require 'neotree)
  (neotree-hide)
  (require 'magit-status)
  (magit-status))


;; rust-mode

(defun spacemacs//rust-setup-checkers ()
  (add-to-list 'flycheck-disabled-checkers 'rust-cargo))
