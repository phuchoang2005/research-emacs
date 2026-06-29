;;; init-completion.el -*- lexical-binding: t; -*-

(use-package vertico
  :init
  (vertico-mode))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package consult)

;; Put embark-consult on the `load-path' before embark loads. embark.el runs
;; `(require 'embark-consult nil 'noerror)' from a `with-eval-after-load
;; 'consult' check, which fires the moment embark loads (consult is already
;; loaded above). If embark-consult isn't yet registered with straight (and thus
;; not on the load-path) that require fails and embark warns "embark-consult
;; should be installed". Registering it here, before embark, makes the check
;; succeed. The full `use-package' form below still configures the hook.
(straight-use-package 'embark-consult)

(use-package embark)

(use-package which-key
  :init
  (which-key-mode))

(use-package embark-consult
  :after (embark consult)
  :demand t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))
;;; setup core project
(setq completion-ignore-case t)

(setq read-buffer-completion-ignore-case t)

(setq read-file-name-completion-ignore-case t)
(setq register-preview-delay 0.5)

(setq register-preview-function
      #'consult-register-format)

(advice-add #'register-preview
            :override
            #'consult-register-window)
(use-package consult-dir
  :bind
  (("C-x C-d" . consult-dir)))
(provide 'init-completion)

