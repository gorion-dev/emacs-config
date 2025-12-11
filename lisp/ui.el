;;; ui.el --- Basic UI settings

;; Turn of unnecesary UI elements
;; These settings make Emacs minimal and distraction-free
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Disable startup screen
;; (setq inhabit-startup-message t)

;; Show line numbers
(global-display-line-numbers-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

;; Set a gentle default font size
(set-face-attribute 'default nil :height 120)

(provide 'ui)
;;; ui.el ends here
