;;; init-org.el --- Org core: notes, agenda, capture -*- lexical-binding: t; -*-

;; Use the built-in org but let straight track the recent release.
(use-package org
  :ensure nil
  :custom
  (org-directory (expand-file-name "~/org/"))
  (org-default-notes-file (expand-file-name "inbox.org" org-directory))
  (org-agenda-files (list org-directory))
  ;; Visual defaults tuned for prose / knowledge work.
  (org-startup-indented t)
  (org-startup-folded 'content)
  (org-hide-emphasis-markers t)
  (org-pretty-entities t)
  (org-ellipsis " ▾")
  (org-image-actual-width '(600))
  (org-edit-src-content-indentation 0)
  (org-src-preserve-indentation t)
  (org-src-fontify-natively t)
  (org-src-tab-acts-natively t)
  ;; TODO workflow + logging.
  (org-todo-keywords
   '((sequence "TODO(t)" "NEXT(n)" "WAIT(w)" "|" "DONE(d)" "CANCELLED(c)")))
  (org-log-done 'time)
  (org-log-into-drawer t)
  ;; Capture templates: quick inbox note + dated journal entry.
  (org-capture-templates
   '(("t" "Task" entry
      (file+headline org-default-notes-file "Tasks")
      "* TODO %?\n  %U\n  %a")
     ("n" "Note" entry
      (file+headline org-default-notes-file "Notes")
      "* %?\n  %U")
     ("j" "Journal" entry
      (file+olp+datetree
       (lambda () (expand-file-name "journal.org" org-directory)))
      "* %?\n  %U")))
  :bind
  (("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   ("C-c l" . org-store-link)))

;; Modern, clean rendering of headings, lists, tables, blocks.
(use-package org-modern
  :after org
  :hook ((org-mode . org-modern-mode)
         (org-agenda-finalize . org-modern-agenda)))

;; Pretty heading bullets (kept per DEMAND.md; org-modern handles most styling).
(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode)
  :custom
  (org-superstar-leading-bullet ?\s))

(provide 'init-org)
