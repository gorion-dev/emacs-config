
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
(require 'ui)      ;; UI tweaks
(require 'editor)  ;; basic editing behavior

;; Org and Zettelkasten modules will come later step-by-step
(require 'org-base)
;; (require 'zk)
;; (require 'keys)
