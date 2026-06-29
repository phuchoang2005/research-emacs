;;; init-editing.el --- Editing enhancements -*- lexical-binding: t; -*-

(use-package avy
  :bind
  ("M-j" . avy-goto-char))

(use-package expand-region
  :bind
  ("C-=" . er/expand-region))

(use-package hungry-delete
  :config
  (global-hungry-delete-mode))

(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package hl-todo
  :config
  (global-hl-todo-mode))

(provide 'init-editing)
