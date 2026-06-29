
;;; init-keybind.el -*- lexical-binding: t; -*-

(global-set-key (kbd "<escape>")
                #'keyboard-escape-quit)

(global-set-key (kbd "C-x k")
                #'kill-current-buffer)

(global-set-key (kbd "C-c r")
                #'recentf-open-files)
(provide 'init-keybind)
