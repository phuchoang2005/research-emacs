;;; init-corfu.el --- In-buffer completion popup -*- lexical-binding: t; -*-

;; Corfu renders completion-at-point candidates in a small popup, the
;; in-buffer counterpart to vertico in the minibuffer.
(use-package corfu
  :custom
  (corfu-auto t)                 ;; pop up automatically while typing
  (corfu-auto-prefix 2)          ;; after this many characters
  (corfu-auto-delay 0.1)
  (corfu-cycle t)                ;; cycle through candidates
  (corfu-preselect 'prompt)      ;; leave the prompt selected, never insert blindly
  (corfu-quit-no-match 'separator)
  :bind
  (:map corfu-map
        ("TAB"      . corfu-next)
        ([tab]      . corfu-next)
        ("S-TAB"    . corfu-previous)
        ([backtab]  . corfu-previous))
  :init
  (global-corfu-mode)
  :config
  ;; corfu-popupinfo ships inside the corfu package (extensions/), so it is
  ;; required here rather than installed as a separate package.
  (require 'corfu-popupinfo)
  (setq corfu-popupinfo-delay '(0.5 . 0.2))
  (corfu-popupinfo-mode 1))

;; Let orderless drive in-buffer completion too, and keep case-insensitive.
(setq completion-cycle-threshold 3
      tab-always-indent 'complete)

(provide 'init-corfu)
