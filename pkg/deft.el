;;; pkg/deft.el -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Notational velocity, backed by OneDrive.
;;; Code:

(require '+custom-pkg-keys-mode "$HOME/.emacs.d/pkg/keys-mode.el")
(require '+custom-pkg-transient "$HOME/.emacs.d/pkg/transient.el")

(use-package deft
  :straight t
  :defer t
  :config (setq
           deft-directory (substitute-in-file-name "$DEFT_PATH")
           deft-default-extension "md"
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

(transient-define-prefix +my-transient-deft-menu ()
 "Start Deft"
 [""
 ("d" "Deft" deft)
 ("q" "quit" keyboard-quit)])

(define-key +custom-keys-mode-map (kbd "C-c d") '+my-transient-deft-menu)

(provide '+custom-pkg-deft)
;;; deft.el ends here
