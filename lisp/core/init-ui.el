;;; init-ui.el -*- lexical-binding: t; -*-

(set-face-attribute
 'default
 nil
 :height 140)

(blink-cursor-mode -1)

(global-hl-line-mode 1)

(show-paren-mode 1)

(setq-default indent-tabs-mode nil)

(setq-default tab-width 4)

(provide 'init-ui)
