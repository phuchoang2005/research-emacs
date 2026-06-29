;;; init-navigation.el --- Navigation -*- lexical-binding: t; -*-

(use-package consult)

(use-package recentf
  :ensure nil
  :init
  (recentf-mode))

(use-package imenu
  :ensure nil)

(use-package xref
  :ensure nil)

(global-set-key (kbd "C-x C-f") #'find-file)

(global-set-key (kbd "C-x b") #'consult-buffer)

(global-set-key (kbd "M-g i") #'consult-imenu)

(global-set-key (kbd "M-g l") #'consult-goto-line)

(global-set-key (kbd "M-g r") #'xref-find-references)

(global-set-key (kbd "M-g d") #'xref-find-definitions)

(global-set-key (kbd "C-c r") #'recentf-open-files)

(provide 'init-navigation)
