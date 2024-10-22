;;; icejam-completing-read -- Functions related to completing-read -*- lexical-binding: t; -*-
;;; Commentary:
;;;
;;; Code:

(require 'icejam-keys-mode)

(use-package vertico :straight t :defer t
  :init
  (defun icejam-vertico-next-page ()
    (interactive)
    (vertico-next 15))
  (defun icejam-vertico-previous-page ()
    (interactive)
    (vertico-previous 15))
  (vertico-mode)
  :custom
  (vertico-scroll-margin 0) ;; Different scroll margin
  (vertico-count 15)        ;; Show more candidates
  (vertico-resize t)        ;; Grow and shrink the Vertico minibuffer
  (vertico-cycle t) ;; Enable cycling for `vertico-next/previous')
  :bind (:map vertico-map
              ("<next>" . icejam-vertico-next-page)
              ("<prior>" . icejam-vertico-previous-page)))

;; Support opening new minibuffers from inside existing minibuffers.
(setq enable-recursive-minibuffers t)

;; Hide commands in M-x which do not work in the current mode.  Vertico
;; commands are hidden in normal buffers. This setting is useful beyond
;; Vertico.
(setq read-extended-command-predicate #'command-completion-default-include-p)

;; Add prompt indicator to `completing-read-multiple'.
;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
(defvar crm-separator)
(defun crm-indicator (args)
  "Add prompt indicator.   Use ARGSs later."
  (cons (format "[CRM%s] %s"
                (replace-regexp-in-string
                 "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                 crm-separator)
                (car args))
        (cdr args)))
(advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
(setq minibuffer-prompt-properties
      '(read-only t cursor-intangible t face minibuffer-prompt))
(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

;; Optionally use the `orderless' completion style.
(use-package orderless :straight t :defer t
  :custom
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia :straight t :defer t :init (marginalia-mode))
(use-package consult :straight t :defer t)
(use-package helpful :straight t :defer t)

(with-eval-after-load 'consult
  (define-key icejam-keys-mode-map (kbd "C-c a") 'consult-ripgrep)
  (define-key icejam-keys-mode-map (kbd "C-c t") 'find-file))

(provide 'icejam-completing-read)
;;; icejam-completing-read.el ends here
