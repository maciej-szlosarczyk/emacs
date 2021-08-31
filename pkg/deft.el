;;; pkg/deft.el -- summary
;;; Commentary:
;;; Notational velocity, backed by OneDrive.
;;; Code:

(require '+custom-pkg-keys-mode "$HOME/.emacs.d/pkg/keys-mode.el")
(require '+custom-pkg-hydra "$HOME/.emacs.d/pkg/hydra.el")

(use-package deft
  :straight t
  :defer t
  :config (setq
           deft-directory (substitute-in-file-name "$HOME/OneDrive/deft")
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

(defhydra +hydra-deft-menu (:color teal)
  "Start Deft"
  ("d" deft "Deft")
  ("q" cancel "quit"))

(define-key +custom-keys-mode-map (kbd "C-c d") '+hydra-deft-menu/body)

(provide '+custom-pkg-deft)
;;; deft.el ends here
