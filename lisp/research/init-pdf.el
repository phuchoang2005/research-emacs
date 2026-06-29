;;; init-pdf.el --- PDF reading & annotation -*- lexical-binding: t; -*-

;; pdf-tools renders PDFs natively (search, select, annotate) and org-noter
;; ties a PDF to an Org notes file for side-by-side annotation.
;;
;; External requirement: the `epdfinfo' server, built from poppler on first
;; run.  `pdf-loader-install' defers that build until a PDF is opened, so
;; loading this module headless is safe.
(use-package pdf-tools
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-loader-install :no-query)
  :custom
  (pdf-view-display-size 'fit-page)
  (pdf-annot-activate-created-annotations t))

(use-package org-noter
  :commands (org-noter)
  :custom
  (org-noter-always-create-frame nil)
  (org-noter-notes-search-path (list (expand-file-name "~/org/"))))

(provide 'init-pdf)
