;;; ui.el --- Basic UI settings

;; Turn of unnecesary UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Dark theme
(load-theme 'modus-vivendi t)

;; Disable startup screen
(setq inhibit-startup-message t)

;; Show line numbers
(global-display-line-numbers-mode -1)

;; Highlight current line
(global-hl-line-mode 1)

 ;; Scale relative to column
(setq org-image-actual-width nil)

;; Wraps text at the edge of the window
(global-visual-line-mode 1)

;; Font size 14pt
(set-face-attribute 'default nil :height 140)

(provide 'ui)
;;; ui.el ends here
