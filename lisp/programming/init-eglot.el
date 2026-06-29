;;; init-eglot.el --- Language Server Protocol -*- lexical-binding: t; -*-

;; Eglot is the built-in LSP client.  It surfaces completion through
;; corfu/cape (capf) and diagnostics through flymake, so this module only
;; wires servers to major modes and exposes the common actions.
(use-package eglot
  :ensure nil
  :hook
  ((python-mode     . eglot-ensure)
   (python-ts-mode  . eglot-ensure)
   (js-mode         . eglot-ensure)
   (js-ts-mode      . eglot-ensure)
   (typescript-mode . eglot-ensure)
   (typescript-ts-mode . eglot-ensure)
   (c-mode          . eglot-ensure)
   (c-ts-mode       . eglot-ensure)
   (c++-mode        . eglot-ensure)
   (c++-ts-mode     . eglot-ensure)
   (java-mode       . eglot-ensure)
   (java-ts-mode    . eglot-ensure))
  :bind
  (:map eglot-mode-map
        ("C-c l r" . eglot-rename)
        ("C-c l a" . eglot-code-actions)
        ("C-c l f" . eglot-format)
        ("C-c l d" . eldoc)
        ("C-c l h" . eldoc))
  :custom
  ;; Keep eglot lean: skip the noisy inlay-hints/progress UI for code reading.
  (eglot-autoshutdown t)
  (eglot-events-buffer-size 0)
  (eglot-extend-to-xref t)
  :config
  ;; Java language server (Eclipse JDT). Requires `jdtls' on PATH.
  (add-to-list 'eglot-server-programs
               '((java-mode java-ts-mode) . ("jdtls"))))

(provide 'init-eglot)
