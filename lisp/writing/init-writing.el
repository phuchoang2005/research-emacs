;;; init-writing.el --- Distraction-free prose -*- lexical-binding: t; -*-

;; Reading-and-writing ergonomics shared by all prose buffers (text,
;; markdown, org): a centred column, soft line wrapping, and a
;; proportional font for body text while code stays fixed-pitch.

(use-package olivetti
  :commands olivetti-mode
  :custom
  (olivetti-body-width 90)
  (olivetti-style 'fancy))

(use-package visual-fill-column
  :commands visual-fill-column-mode
  :custom
  (visual-fill-column-center-text t)
  (visual-fill-column-width 90))

(use-package mixed-pitch
  :commands mixed-pitch-mode)

;; A single entry point: turn a buffer into a comfortable prose surface.
(defun my/prose-mode ()
  "Enable soft-wrap, centred column and proportional body text."
  (interactive)
  (visual-line-mode 1)
  (visual-fill-column-mode 1)
  (olivetti-mode 1)
  (mixed-pitch-mode 1))

(dolist (hook '(text-mode-hook
                markdown-mode-hook
                org-mode-hook))
  (add-hook hook #'my/prose-mode))

(provide 'init-writing)
