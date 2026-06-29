;;; init-theme.el -*- lexical-binding: t; -*-

(setq frame-title-format
      '("%b  —  GNU Emacs"))

;; Trust themes so `load-theme' (used by auto-dark) doesn't prompt or refuse.
(setq custom-safe-themes t)

;; Rosé Pine themes are built on autothemer; pull it in explicitly since the
;; theme files only `require` it at load time.
(use-package autothemer)

;; Rosé Pine: a soho-vibes theme shipping a matched dark/light set
;; (`rose-pine-color` = canonical dark, `rose-pine-moon` = dimmer dark,
;; `rose-pine-dawn` = light). The package provides no feature to `require`, so we
;; only clone it and put its build directory on `custom-theme-load-path` for
;; `load-theme` to find the variants.
(use-package rose-pine
  :straight (rose-pine :type git :host github :repo "thongpv87/rose-pine-emacs"
                       :no-build t)
  :no-require t
  :init
  (add-to-list 'custom-theme-load-path
               (straight--repos-dir "rose-pine-emacs")))

;; Follow the macOS system appearance and swap between the light/dark Rosé Pine
;; variants. We detect the appearance from `ns-system-appearance' (an emacs-plus
;; patch, when present) or from `defaults read -g AppleInterfaceStyle', and avoid
;; AppleScript/System Events entirely — that path needs Automation permission and
;; otherwise fails with "AppleScript error 1".
(defvar my/light-theme 'rose-pine-dawn "Theme to use when macOS is in light mode.")
(defvar my/dark-theme  'rose-pine-color "Theme to use when macOS is in dark mode.")

(defun my/system-dark-p ()
  "Return non-nil when macOS is currently in Dark mode."
  (cond
   ((boundp 'ns-system-appearance) (eq ns-system-appearance 'dark))
   (t (string= "Dark"
               (string-trim
                (shell-command-to-string
                 "defaults read -g AppleInterfaceStyle 2>/dev/null"))))))

(require 'color)  ; color-lighten-name / color-darken-name

(defun my/refine-selection-faces ()
  "Neutralize the theme's selection/highlight bands.

Rosé Pine picks these highlight backgrounds independently of the faces drawn
on top of them, so saturated foregrounds (e.g. `dired-symlink' on a symlink,
a completion candidate under `vertico-current', or selected source code under
`region') collide with them and become unreadable.  Deriving each band from
the current default background — lightening it in dark mode, darkening it in
light mode — keeps it neutral so any foreground reads cleanly, and adapts
automatically to whichever variant is loaded.  The active completion
candidate and the region get a stronger shade than the passive `hl-line' so
they still stand out."
  (let* ((bg (face-attribute 'default :background))
         (dark (eq (frame-parameter nil 'background-mode) 'dark))
         (shade (lambda (pct) (if dark
                                  (color-lighten-name bg pct)
                                (color-darken-name bg pct)))))
    (when (color-defined-p bg)
      (set-face-attribute 'hl-line nil :background (funcall shade (if dark 8 6))
                          :extend t)
      ;; Selection bands — stronger shade than hl-line, foreground left to the
      ;; underlying text so syntax colors / candidate colors survive.
      (dolist (face '(vertico-current completions-highlight
                      region secondary-selection))
        (when (facep face)
          (set-face-attribute face nil
                              :background (funcall shade (if dark 16 12))
                              :foreground 'unspecified :extend t))))))

(defun my/apply-system-theme (&optional appearance)
  "Enable the Rosé Pine variant matching the system APPEARANCE.
APPEARANCE may be `dark' or `light' (as passed by
`ns-system-appearance-change-functions'); when nil it is detected."
  (let* ((dark (pcase appearance
                 ('dark t)
                 ('light nil)
                 (_ (my/system-dark-p))))
         (theme (if dark my/dark-theme my/light-theme)))
    (unless (and (memq theme custom-enabled-themes)
                 (= (length custom-enabled-themes) 1))
      (mapc #'disable-theme custom-enabled-themes)
      (load-theme theme t))
    ;; Re-apply after every (re)load: `load-theme' resets these faces.
    (my/refine-selection-faces)))

(if (boundp 'ns-system-appearance-change-functions)
    ;; Native (emacs-plus) hook: fires immediately and on every toggle.
    (add-hook 'ns-system-appearance-change-functions #'my/apply-system-theme)
  ;; Stock NS build: apply once, then poll for toggles.
  (my/apply-system-theme)
  (run-with-timer 5 5 #'my/apply-system-theme))

(provide 'init-theme)
