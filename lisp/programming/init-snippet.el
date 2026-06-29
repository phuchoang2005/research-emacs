;;; init-snippet.el --- Snippet expansion -*- lexical-binding: t; -*-

;; YASnippet expands short keys into templates.  Personal snippets live in
;; the repo's snippets/ directory; yasnippet-snippets adds a community set.
(use-package yasnippet
  :init
  (setq yas-snippet-dirs
        (list (expand-file-name "snippets" user-emacs-directory)))
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :after yasnippet)

(provide 'init-snippet)
