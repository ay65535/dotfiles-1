;;; packages.el - wsp layer file for Spacemacs
;;
;; Copyright (c) 2018 Seong Yong-ju
;;
;; Author: Seong Yong-ju <sei40kr@gmail.com>
;; URL: https://github.com/sei40kr/dotfiles
;;
;; This file is not part of GNU Emacs
;;
;;; License: MIT

(setq wsp-packages '(org-jira))

(defun wsp/post-init-org-jira ()
  (setq jiralib-url "https://teamspiritdev.atlassian.net"))
