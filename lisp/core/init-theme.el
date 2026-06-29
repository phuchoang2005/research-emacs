;;; init-theme.el -*- lexical-binding: t; -*-

(setq frame-title-format
      '("%b  —  GNU Emacs"))

;; Custom Solarized Osaka theme lives alongside this module.
(add-to-list 'custom-theme-load-path
             (file-name-directory (or load-file-name buffer-file-name)))

(load-theme 'solarized-osaka t)

(provide 'init-theme)
