;;; icejam-completing-read -- Functions related to completing-read -*- lexical-binding: t; -*-
;;; Commentary:
;;;
;;; Code:

(require 'icejam-keys-mode)

;; Preparations for using Vertico/Orderless
(setq
 ;; Support opening new minibuffers from inside existing minibuffers.
 enable-recursive-minibuffers t
 ;; Hide commands in M-x which do not work in the current mode.  Vertico
 ;; commands are hidden in normal buffers. This setting is useful beyond
 ;; Vertico.
 read-extended-command-predicate #'command-completion-default-include-p
 ;; Do not allow the cursor in the minibuffer prompt
 minibuffer-prompt-properties '(read-only t cursor-intangible t face minibuffer-prompt))

(defun crm-indicator (args)
  (cons (format "[CRM%s] %s"
                (replace-regexp-in-string
                 "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                 crm-separator)
                (car args))
        (cdr args)))
(advice-add #'completing-read-multiple :filter-args #'crm-indicator)
(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

;; Actual orderless
(use-package vertico :ensure t)
(use-package orderless :ensure t)
(use-package marginalia :ensure t)
(use-package consult :ensure t)
(use-package helpful :ensure t)

(with-eval-after-load 'vertico
  (setq
   vertico-scroll-margin 0 ;; Different scroll margin
   vertico-count 15        ;; Show more candidates
   vertico-resize t        ;; Grow and shrink the Vertico minibuffer
   vertico-cycle t         ;; Enable cycling for `vertico-next/previous'
   )
  (vertico-mode))

(with-eval-after-load 'orderless
  (setq
   ;; Configure a custom style dispatcher (see the Consult wiki)
   ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
   ;; (orderless-component-separator #'orderless-escapable-split-on-space)
   completion-styles '(orderless basic) ;; Fallback to basic
   completion-category-defaults nil
   completion-category-overrides '((file (styles partial-completion)))))

(with-eval-after-load 'marginalia
  (marginalia-mode t))

(with-eval-after-load 'consult
  (define-key icejam-keys-mode-map (kbd "C-c a") 'consult-ripgrep)
  (define-key icejam-keys-mode-map (kbd "C-c t") 'find-file))

(provide 'icejam-completing-read)
;;; icejam-completing-read.el ends here
