;;; init-window.el -*- lexical-binding: t; -*-

(windmove-default-keybindings)

(setq switch-to-buffer-obey-display-actions t)

(global-set-key
 (kbd "C-x 2")
 #'split-window-below)

(global-set-key
 (kbd "C-x 3")
 #'split-window-right)

(global-set-key
 (kbd "C-x 1")
 #'delete-other-windows)

(global-set-key
 (kbd "C-x 0")
 #'delete-window)

(provide 'init-window)
