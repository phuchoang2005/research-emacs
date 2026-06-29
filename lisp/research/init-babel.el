;;; init-babel.el --- Literate code execution (Org Babel) -*- lexical-binding: t; -*-

;; Org Babel turns Org into a notebook: source blocks are evaluated in
;; place.  ob-python / ob-shell / ob-C ship with Org itself.
(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python     . t)
     (shell      . t)
     (C          . t)))

  ;; Don't prompt for confirmation on trusted languages we run constantly.
  (setq org-confirm-babel-evaluate
        (lambda (lang _body)
          (not (member lang '("python" "shell" "emacs-lisp" "C")))))

  ;; Edit source blocks in the current window, keep their indentation.
  (setq org-src-window-setup 'current-window
        org-babel-python-command "python3"))

(provide 'init-babel)
