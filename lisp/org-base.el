;;; org-base.el --- Basic Org configuration

(require 'org)

;; When pasting, keep formatting from HTML (lists, links, bold, etc.)
(setq org-catch-invisible-edits 'show)

;; Use proper indentation automatically
(setq org-startup-indented t)

;; Automatic syntax highlighting in source blocks
(setq org-src-fontify-natively t)

;; When copying code, use #+begin_src ... blocks automatically
(setq org-edit-src-content-indentation 0)

;; Allow using org links like [[file:...]] easily
(setq org-return-follows-link t)

(provide 'org-base)
;;; core-org.el ends here
