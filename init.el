
;; Basic init file with minimal structure
;; This will load our own modules from ~/.emacs.d/lisp/

;; Add custom module directory to load-path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Show startup time and garbage collector info
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs loaded in %s with %d GC"
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; Load modules
(require 'ui)           ;; UI tweaks
(require 'editor)       ;; basic editing behavior
(require 'org-base)     ;; image handling for Org mode
(require 'org-images)
;; (require 'zk)
;; (require 'keys)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(visual-fill-column)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
