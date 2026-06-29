;;; init-project.el --- Project management -*- lexical-binding: t; -*-

;; Built-in project.el: root detection + the project-switch menu.
;; NOTE: a single `project-switch-commands' definition lives here so the
;; magit entry is not dropped (the previous config set it twice and the
;; later plain `setq' silently overrode the magit entry).
(use-package project
  :ensure nil
  :custom
  (project-vc-extra-root-markers
   '(".project"
     ".git"
     "package.json"
     "Cargo.toml"
     "go.mod"
     "Makefile"
     "pyproject.toml"))
  (project-switch-commands
   '((project-find-file "Find file")
     (consult-ripgrep "Ripgrep")
     (project-find-dir "Directory")
     (project-shell "Shell")
     (magit-project-status "Magit"))))

;; consult search entry points
(use-package consult
  :bind
  (("C-s"   . consult-line)
   ("C-c f" . consult-ripgrep)
   ("C-c b" . consult-buffer)
   ("C-c m" . consult-imenu)))

;; project prefix bindings.  `C-c p' is a *prefix* (must not also be bound to
;; a command directly, or "C-c p f starts with non-prefix key C-c p" errors).
(global-set-key (kbd "C-c p p") #'project-switch-project)
(global-set-key (kbd "C-c p f") #'project-find-file)
(global-set-key (kbd "C-c p s") #'consult-ripgrep)

(provide 'init-project)
