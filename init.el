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

;; Hide emphasis markers in org docs
(setq org-hide-emphasis-markers t)

;; Display line numbers
(global-display-line-numbers-mode t)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Allow Space in completion minibuffer
(define-key minibuffer-local-completion-map (kbd "SPC") #'self-insert-command)

;; Set the default font size
;; Height is in 1/10 pt, so 130 = 13pt
(set-face-attribute 'default nil :height 130)

;; Show inline images in .org files
(setq org-startup-with-inline-images t)
(setq org-image-actual-width nil)
(setq org-image-max-width 600)

;; Configure package repositories
(require 'package)
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
	 ("C-c n c" . org-roam-capture)
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

;; Use python3 for org-babel.
(setq org-babel-python-command "python3")

;; Use spaces instead of tabs
(setq indent-tabs-mode nil)

;; Org source block indentation
(setq org-edit-src-content-indentation 0) ;; Adjusts indentation inside the org buffer
(setq org-src-preserve-indentation nil)   ;; Let python-mode handle indentation

;; Python indentation
(defun my-python-mode-hook ()
  "Custom settings for python-mode."
  (setq indent-tabs-mode nil        ;; Ensure no tabs
        tab-width 4                 ;; Set tab width to 4 spaces
        python-indent-offset 4))    ;; Set indentation level to 4 spaces

(add-hook 'python-mode-hook #'my-python-mode-hook)

;; Disable confirmation for babel evaluation
(setq org-confirm-babel-evaluate nil)

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

;; --------------------------------------------------
;; Eglot configuration
;; --------------------------------------------------
(use-package eglot
  :hook (python-mode . eglot-ensure))

;; Make ~/.local/bin visible to Emacs (pipx, user tools)
(let ((local-bin (expand-file-name "~/.local/bin")))
  (when (file-directory-p local-bin)
    (add-to-list 'exec-path local-bin)
    (setenv "PATH" (concat local-bin ":" (getenv "PATH")))))

;; --------------------------------------------------
;; Themes configuration
;; --------------------------------------------------

(use-package nerd-icons)

(use-package doom-themes
  :ensure t
  :custom
  ;; Global settings (defaults)
  (doom-themes-enable-bold t)   ; if nil, bold is universally disabled
  (doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (doom-themes-treemacs-theme "doom-atom")
  :config
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))
