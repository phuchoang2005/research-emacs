;;; init-notebook.el --- Jupyter kernels in Org -*- lexical-binding: t; -*-

;; emacs-jupyter drives real Jupyter kernels, providing the Jupyter
;; notebook replacement: rich `jupyter' Org Babel blocks with inline
;; results, completion and inspection.
;;
;; External requirements (surface only at runtime, not at load):
;;   - python3 with the `jupyter' package, and
;;   - the ZeroMQ (zmq) module, built on first use.
(use-package jupyter
  :after org
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   (append org-babel-load-languages '((jupyter . t))))
  ;; Use python3 kernels by default for :session blocks.
  (setq jupyter-eval-use-overlays t))

(provide 'init-notebook)
