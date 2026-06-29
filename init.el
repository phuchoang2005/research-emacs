;;; init.el --- Module loader -*- lexical-binding: t; -*-

;; This file only wires up the load-path and `require's each layer module
;; in dependency order. No feature configuration lives here.

;; Add every lisp/ subfolder (the layered architecture) to the load-path.
(let ((lisp-dir (expand-file-name "lisp" user-emacs-directory)))
  (dolist (subdir '("core"
                    "completion"
                    "editing"
                    "project"
                    "programming"
                    "writing"
                    "research"))
    (add-to-list 'load-path (expand-file-name subdir lisp-dir))))

;; --- Bootstrap (must come first: sets straight + use-package defaults) ---
(require 'init-package)

;; --- Core layer ---
(require 'init-core)
(require 'init-ui)
(require 'init-theme)
(require 'init-font)
(require 'init-keybind)
(require 'init-window)
(require 'init-backup)

;; --- Completion / navigation layer ---
(require 'init-completion)
(require 'init-navigation)

;; --- Editing layer ---
(require 'init-editing)

;; --- Project layer ---
(require 'init-project)
(require 'init-git)

;; --- Programming layer ---
(require 'init-prog)
(require 'init-corfu)
(require 'init-cape)
(require 'init-snippet)
(require 'init-treesit)
(require 'init-flymake)
(require 'init-eglot)
(require 'init-web)

;; --- Writing layer ---
(require 'init-writing)
(require 'init-markdown)

;; --- Research layer ---
(require 'init-org)
(require 'init-babel)
(require 'init-notebook)
(require 'init-latex)
(require 'init-pdf)
(require 'init-roam)

;;; init.el ends here
