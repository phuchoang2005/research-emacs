;;; init-flymake.el --- On-the-fly diagnostics -*- lexical-binding: t; -*-

;; Flymake is the built-in diagnostics framework.  Eglot feeds its LSP
;; diagnostics through flymake, so enabling it in prog-mode covers both
;; language-server errors and standalone checkers.
(use-package flymake
  :ensure nil
  :hook (prog-mode . flymake-mode)
  :bind
  (:map flymake-mode-map
        ("M-n"   . flymake-goto-next-error)
        ("M-p"   . flymake-goto-prev-error)
        ("C-c ! l" . flymake-show-buffer-diagnostics)
        ("C-c ! L" . flymake-show-project-diagnostics))
  :custom
  (flymake-no-changes-timeout 0.5)
  (flymake-fringe-indicator-position 'right-fringe))

(provide 'init-flymake)
