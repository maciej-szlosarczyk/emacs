;;; icejam-deft.el -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Notational velocity, backed by OneDrive.
;;; Code:

(require 'icejam-keys-mode)
(require 'icejam-transient)

(use-package deft
  :straight t
  :defer t
  :config (setq
           deft-directory (substitute-in-file-name "$DEFT_PATH")
           deft-default-extension "md"
           deft-ignore-file-regexp "^\\._[0-9-A-Z]+.md$"
           deft-strip-summary-regexp (concat "\\("
              "[\n\t]" ;; blank
              "\\|^:[[:ascii:]]+:.*$" ;; org-mode properties string
              "\\|^Title:.*$" ;; Title string
              "\\|^title:.*$" ;; title string
              "\\|^\\[\\[file:.*$" ;; org-mode inline-images
              ;; org-mode properties
              ;; "\\|:PROPERTIES:\n\\(.+\n\\)+:END:\n" ;;
              "\\)")
           deft-auto-save-interval 30.0))

(transient-define-prefix +custom-pkg-deft/menu ()
 "Start Deft."
 [""
 ("d" "Deft" deft)
 ("q" "quit" keyboard-quit)])

(define-key +custom-keys-mode-map (kbd "C-c d") '+custom-pkg-deft/menu)

(provide 'icejam-deft)
;;; icejam-deft.el ends here
