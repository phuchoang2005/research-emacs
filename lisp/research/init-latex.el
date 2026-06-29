;;; init-latex.el --- Professional LaTeX editing -*- lexical-binding: t; -*-

;; AUCTeX provides the editing/compiling environment; CDLaTeX speeds up
;; math entry; RefTeX (built-in) manages labels, refs and citations.
;; Compilation is driven by `latexmk' and previews use pdf-tools.

(use-package auctex
  :no-require t                 ;; AUCTeX has no `auctex' feature to require
  :mode ("\\.tex\\'" . LaTeX-mode)
  :hook
  ((LaTeX-mode . turn-on-reftex)        ;; label/citation management
   (LaTeX-mode . turn-on-cdlatex)       ;; fast math input
   (LaTeX-mode . TeX-source-correlate-mode) ;; forward/inverse search
   (LaTeX-mode . flymake-mode))
  :custom
  (TeX-auto-save t)
  (TeX-parse-self t)
  (TeX-PDF-mode t)
  (TeX-master nil)              ;; ask which master file for multi-file docs
  (reftex-plug-into-AUCTeX t)
  ;; SyncTeX: jump between source and PDF.
  (TeX-source-correlate-start-server t)
  :config
  ;; Compile with latexmk and view in pdf-tools (refreshes the open buffer).
  (with-eval-after-load 'tex
    (add-to-list 'TeX-command-list
                 '("LaTeXmk" "latexmk -pdf -synctex=1 %s"
                   TeX-run-TeX nil t :help "Build with latexmk"))
    (setq TeX-command-default "LaTeXmk")
    (add-to-list 'TeX-view-program-selection
                 '(output-pdf "PDF Tools"))
    (add-hook 'TeX-after-compilation-finished-functions
              #'TeX-revert-document-buffer)))

(use-package cdlatex
  :commands (turn-on-cdlatex cdlatex-mode))

(provide 'init-latex)
