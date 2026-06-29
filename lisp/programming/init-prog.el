;;; init-prog.el --- Generic programming defaults -*- lexical-binding: t; -*-

;; Umbrella module for behaviour that applies to *every* programming
;; buffer.  Language servers (eglot), completion (corfu/cape), diagnostics
;; (flymake), grammars (treesit) and snippets live in their own modules.

;; Built-in code folding via hideshow.
(use-package hideshow
  :ensure nil
  :hook (prog-mode . hs-minor-mode)
  :bind (:map prog-mode-map
              ("C-c @ @" . hs-toggle-hiding)))

;; Visual aids that only make sense in code buffers.
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'hl-line-mode)

;; Sensible editing defaults for source files.
(setq-default indent-tabs-mode nil
              tab-width 4)

;; Treat CamelCase sub-words as separate words when navigating code.
(add-hook 'prog-mode-hook #'subword-mode)

;; Always show matching delimiters with minimal delay.
(setq show-paren-delay 0)

(provide 'init-prog)
