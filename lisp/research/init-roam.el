;;; init-roam.el --- Research workspace: roam + bibliography -*- lexical-binding: t; -*-

;; The integrating layer: a Zettelkasten over Org files (org-roam), a daily
;; journal (org-roam-dailies) and bibliography/citation management (citar).

(use-package org-roam
  :after org
  :custom
  (org-roam-directory (expand-file-name "~/org/roam/"))
  (org-roam-dailies-directory "journal/")
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(("d" "default" plain "%?"
      :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                         "#+title: ${title}\n")
      :unnarrowed t)))
  (org-roam-dailies-capture-templates
   '(("d" "default" entry "* %?"
      :target (file+head "%<%Y-%m-%d>.org"
                         "#+title: %<%Y-%m-%d>\n"))))
  :bind
  (("C-c n f" . org-roam-node-find)
   ("C-c n i" . org-roam-node-insert)
   ("C-c n c" . org-roam-capture)
   ("C-c n b" . org-roam-buffer-toggle)
   ("C-c n j" . org-roam-dailies-capture-today)
   ("C-c n t" . org-roam-dailies-goto-today))
  :config
  ;; Create the directory before the SQLite db tries to write into it.
  (make-directory org-roam-directory t)
  (org-roam-db-autosync-mode))

;; Bibliography: browse a .bib library and insert citations into org/latex/md.
(use-package citar
  :after org
  :custom
  (citar-bibliography (list (expand-file-name "~/org/bib/references.bib")))
  (citar-notes-paths   (list (expand-file-name "~/org/roam/")))
  (org-cite-global-bibliography citar-bibliography)
  (org-cite-insert-processor 'citar)
  (org-cite-follow-processor 'citar)
  (org-cite-activate-processor 'citar)
  :bind
  (("C-c n r" . citar-insert-citation)
   ("C-c n o" . citar-open)))

(provide 'init-roam)
