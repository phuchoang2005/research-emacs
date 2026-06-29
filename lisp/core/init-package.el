;;; init-package.el -*- lexical-binding: t; -*-

(defvar bootstrap-version)

(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        user-emacs-directory))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent
         'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))

  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

;; Actually load use-package so its macro and straight's `:straight' keyword
;; integration are in place. Without this, `use-package' is only autoloaded and
;; `straight-use-package-by-default' never takes effect, so packages are never
;; registered with straight and `require' fails at load time.
(require 'use-package)

(setq straight-use-package-by-default t)

(provide 'init-package)
