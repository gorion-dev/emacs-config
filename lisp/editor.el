;;; editor.el --- Basic editing behavior

;; Tabs are evil: use spaces
(setq-default indent-tabs-mode nil)

;; Default tab width
(setq-default tab-width 4)

;; Save backups in a separate directory
(setq backup-directory-alist '((".*" . "~/.emacs.d/backups/")))

;; Auto-refresh buffers when files change on disk
(global-auto-revert-mode 1)

;; Save cursor position in files
(save-place-mode 1)

;; Enable y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

(provide 'editor)
;;; editor.el ends here
