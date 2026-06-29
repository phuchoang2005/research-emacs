;;; init-git.el --- Git workflow -*- lexical-binding: t; -*-

;; Magit: the Git porcelain.
(use-package magit
  :bind
  (("C-x g"   . magit-status)
   ("C-c g"   . magit-file-dispatch)
   ("C-x M-g" . magit-dispatch))
  :custom
  ;; Show full-frame status, restore the previous window layout on quit.
  (magit-display-buffer-function
   #'magit-display-buffer-fullframe-status-v1)
  (magit-bury-buffer-function #'magit-restore-window-configuration)
  ;; Highlight word-level changes within a hunk.
  (magit-diff-refine-hunk t))

;; diff-hl: live VC change indicators in the fringe.
(use-package diff-hl
  :hook
  ((prog-mode . diff-hl-mode)
   (text-mode . diff-hl-mode)
   (dired-mode . diff-hl-dired-mode)
   ;; Keep the fringe in sync with magit operations.
   (magit-pre-refresh  . diff-hl-magit-pre-refresh)
   (magit-post-refresh . diff-hl-magit-post-refresh))
  :config
  (global-diff-hl-mode)
  ;; Update indicators on the fly, not only on save.
  (diff-hl-flydiff-mode))

(provide 'init-git)
