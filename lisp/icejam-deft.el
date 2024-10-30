;;; icejam-deft.el -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Notational velocity, backed by OneDrive.
;;; Code:

(require 'icejam-keys-mode)
(require 'icejam-transient)

(use-package deft :ensure t
  :custom
  ((deft-directory (substitute-in-file-name "$DEFT_PATH"))
   (deft-default-extension "md")
   (deft-ignore-file-regexp "\\._[0-9-A-Z_]+\\.md$")
   (deft-strip-summary-regexp (concat "\\("
                                      "[\n\t]" ;; blank
                                      "\\|^:[[:ascii:]]+:.*$" ;; org-mode properties string
                                      "\\|^Title:.*$" ;; Title string
                                      "\\|^title:.*$" ;; title string
                                      "\\|^\\[\\[file:.*$" ;; org-mode inline-images
                                      ;; org-mode properties
                                      ;; "\\|:PROPERTIES:\n\\(.+\n\\)+:END:\n" ;;
                                      "\\)"))
   (deft-auto-save-interval 30.0)))

(provide 'icejam-deft)
;;; icejam-deft.el ends here
