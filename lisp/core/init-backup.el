;;; init-backup.el -*- lexical-binding: t; -*-

(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 "backup"
                 user-emacs-directory))))

(setq auto-save-file-name-transforms
      `((".*"
         ,temporary-file-directory
         t)))

(setq create-lockfiles nil)

(provide 'init-backup)
