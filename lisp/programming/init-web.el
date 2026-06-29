;;; init-web.el --- HTML & CSS editing -*- lexical-binding: t; -*-

;; Front-end markup/styling support.  web-mode handles HTML and mixed
;; template files; CSS uses the built-in css-mode (remapped to css-ts-mode
;; by treesit-auto when a grammar is present).  emmet-mode gives the usual
;; abbreviation expansion.  Language servers come from
;; vscode-langservers-extracted (`vscode-html-language-server' and
;; `vscode-css-language-server' on PATH), which eglot already knows about.

;; HTML and template files.
(use-package web-mode
  :mode (("\\.html?\\'"      . web-mode)
         ("\\.phtml\\'"      . web-mode)
         ("\\.tpl\\.php\\'"  . web-mode)
         ("\\.[agj]sp\\'"    . web-mode)
         ("\\.erb\\'"        . web-mode)
         ("\\.vue\\'"        . web-mode)
         ("\\.svelte\\'"     . web-mode))
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2)
  (web-mode-enable-auto-pairing t)
  (web-mode-enable-css-colorization t)
  (web-mode-enable-current-element-highlight t))

;; Built-in CSS/SCSS/Less editing.
(use-package css-mode
  :ensure nil
  :mode (("\\.css\\'"  . css-mode)
         ("\\.scss\\'" . scss-mode)
         ("\\.less\\'" . css-mode))
  :custom
  (css-indent-offset 2))

;; Emmet expansion (C-j) for HTML and CSS buffers.
(use-package emmet-mode
  :hook ((web-mode  . emmet-mode)
         (html-mode . emmet-mode)
         (css-mode  . emmet-mode)
         (css-ts-mode . emmet-mode)
         (scss-mode . emmet-mode)))

;; Inline preview of colour values in any web/CSS buffer.
(use-package rainbow-mode
  :hook ((web-mode    . rainbow-mode)
         (css-mode    . rainbow-mode)
         (css-ts-mode . rainbow-mode)
         (scss-mode   . rainbow-mode)))

;; Attach the LSP servers.  eglot's defaults already map css-mode and
;; html-mode to the vscode-* servers; web-mode just needs adding.
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(web-mode . ("vscode-html-language-server" "--stdio")))
  (dolist (hook '(web-mode-hook
                  css-mode-hook
                  css-ts-mode-hook
                  scss-mode-hook))
    (add-hook hook #'eglot-ensure)))

(provide 'init-web)
