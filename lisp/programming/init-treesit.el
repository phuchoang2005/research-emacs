;;; init-treesit.el --- Tree-sitter grammars -*- lexical-binding: t; -*-

;; Tree-sitter gives faster, more accurate syntax highlighting and
;; structural navigation.  Only do anything when the running Emacs was
;; built with tree-sitter support.
(when (and (fboundp 'treesit-available-p)
           (treesit-available-p))

  ;; Explicit grammar sources so `M-x treesit-install-language-grammar'
  ;; knows where to fetch from.  Note: `.jsx' is parsed by the
  ;; `javascript' grammar and `.tsx' by the `tsx' grammar — there is no
  ;; separate "jsx" grammar.
  (setq treesit-language-source-alist
        '((yaml       "https://github.com/ikatyang/tree-sitter-yaml")
          (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "v0.21.2" "src")
          (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
          (tsx        "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")))

  ;; treesit-auto installs missing grammars on demand and remaps the
  ;; classic major modes to their *-ts-mode counterparts automatically.
  (use-package treesit-auto
    :custom
    (treesit-auto-install 'prompt)   ;; ask before downloading a grammar
    :config
    (treesit-auto-add-to-auto-mode-alist 'all)
    (global-treesit-auto-mode))

  ;; Deeper fontification when grammars are present.
  (setq treesit-font-lock-level 4))

(provide 'init-treesit)
