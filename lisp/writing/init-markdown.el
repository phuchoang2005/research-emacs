;;; init-markdown.el --- Markdown editing & preview -*- lexical-binding: t; -*-

(use-package markdown-mode
  :mode (("README\\.md\\'" . gfm-mode)       ;; GitHub-flavoured for READMEs
         ("\\.md\\'"       . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :custom
  ;; Used by `markdown-preview' / live export; falls back gracefully if absent.
  (markdown-command "pandoc")
  (markdown-fontify-code-blocks-natively t)
  (markdown-hide-urls nil)
  (markdown-enable-math t)
  :bind
  (:map markdown-mode-map
        ("C-c C-v" . markdown-preview)
        ("C-c C-l" . markdown-insert-link)))

(provide 'init-markdown)
