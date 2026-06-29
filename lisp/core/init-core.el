;;; init-core.el -*- lexical-binding: t; -*-

(setq make-backup-files nil)

(setq auto-save-default nil)

(setq create-lockfiles nil)

(setq ring-bell-function 'ignore)

(setq use-dialog-box nil)

(setq visible-bell nil)

(setq confirm-kill-emacs #'y-or-n-p)

(global-auto-revert-mode 1)

(save-place-mode 1)

(savehist-mode 1)

(recentf-mode 1)

(electric-pair-mode 1)

(delete-selection-mode 1)

(global-display-line-numbers-mode 1)

(column-number-mode 1)

(pixel-scroll-precision-mode 1)


(provide 'init-core)
