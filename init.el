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

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Set the default font size
;; Height is in 1/10 pt, so 140 = 14pt

(set-face-attribute 'default nil :height 140)

;; Setup theme
(load-theme 'wombat)

;; Show inline images in .org files
(setq org-startup-with-inline-images t)
(setq org-display-remote-inline-images 'cache)

;; Load the built-in package manager
(require 'package)

;; Configure package repositories
;; ELPA  - official GNU repository
;; Org   - latest Org mode releases
;; MELPA - large community repository with frequent updates
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize installed packages and update load-path
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

;; Enable visual line wrapping globally
(global-visual-line-mode 1)

;; --------------------------------------------------
;; Ivy completion framework configuration
;; --------------------------------------------------

(use-package ivy
    :diminish ;; hide Ivy mode from status bar
    ;; Key bindings section
    :bind (("C-s" . swiper) ;; call swiper
  	 ;; Key bindings specific to certain mods
           :map ivy-minibuffer-map
           ("TAB" . ivy-alt-done)	
           ("C-l" . ivy-alt-done)
           ("C-j" . ivy-next-line)
           ("C-k" . ivy-previous-line)
           :map ivy-switch-buffer-map
           ("C-k" . ivy-previous-line)
           ("C-l" . ivy-done)
           ("C-d" . ivy-switch-buffer-kill)
           :map ivy-reverse-i-search-map
           ("C-k" . ivy-previous-line)
           ("C-d" . ivy-reverse-i-search-kill))
    :config
    (ivy-mode 1))

;; --------------------------------------------------
;; Kotlin support
;; --------------------------------------------------

;; Major mode for editing Kotlin source files
(use-package kotlin-mode)

;; --------------------------------------------------
;; Org-roam configuration
;; --------------------------------------------------

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/notes")
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "${title}.org" "#+title: ${title}\n")
      :unnarrowed t)))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i"    . completion-at-point))
  :config
  (org-roam-setup))

;; --------------------------------------------------
;; Org-babel configuration
;; --------------------------------------------------

;; Enable Python support in org-babel.
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; Use python3 as the interpreter for org-babel.
(setq org-babel-python-command "python3")

;; Disable confirmation prompts when evaluating org-babel source blocks.
(setq org-confirm-babel-evaluate nil)

;; --------------------------------------------------
;; Org-agenda configuration
;; --------------------------------------------------

;; Define org-agenda directory
(setq org-agenda-files (quote ("~/notes")))

;; --------------------------------------------------
;; Treemacs configuration
;; --------------------------------------------------
(use-package treemacs
  :ensure t
  :config
  ;; Treemacs as left panel, and not like plain buffer
  (setq treemacs-width 30
	treemacs-is-never-other-window t)
  ;; Follow to project.el projects
  (treemacs-project-follow-mode t))
