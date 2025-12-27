;; Disable the startup screen and message
(setq inhibit-startup-message t)

;; Disable the visible scroll bar
(scroll-bar-mode -1)

;; Disable the toolbar (icons at the top)
(tool-bar-mode -1)

;; Disable the menu bar (File, Edit, etc.)
(menu-bar-mode -1)

;; Disable mouse hover tooltips
(tooltip-mode -1)

;; Add some space on the left and right edges of the window
;; (used for indicators like line continuation, errors, etc.)
(set-fringe-mode 10)

;; Flash the screen instead of making a sound on errors
(setq visible-bell t)

;; Set the default font size
;; Height is in 1/10 pt, so 140 = 14pt

(set-face-attribute 'default nil :height 140)

;; Setup theme
(load-theme 'tango-dark)


;; Load the built-in package manager
(package-initialize)

;; Refresh package archive contents if not already available
;; This avoids unnecessary network calls on every startup
(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package if it is not already installed
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; Load use-package
(require 'use-package)

;; Automatically install missing packages declared with use-package
(setq use-package-always-ensure t)
