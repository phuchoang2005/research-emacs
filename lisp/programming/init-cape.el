;;; init-cape.el --- Completion-at-point backends -*- lexical-binding: t; -*-

;; Cape provides extra `completion-at-point-functions' (capfs) that feed
;; candidates into corfu: words from buffers, file paths, language keywords.
(use-package cape
  :init
  ;; Order matters: earlier entries are tried first.
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  :bind
  (("C-c x p" . completion-at-point)
   ("C-c x d" . cape-dabbrev)
   ("C-c x f" . cape-file)
   ("C-c x k" . cape-keyword)))

(provide 'init-cape)
