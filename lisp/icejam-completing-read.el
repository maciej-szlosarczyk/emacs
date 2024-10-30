;;; icejam-completing-read -- Functions related to completing-read -*- lexical-binding: t; -*-
;;; Commentary:
;;;
;;; completing-read is the way of completing things in minibuffer.  This module
;;; provides all of that functionality, everything related to minbuffer being helpful.
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
(use-package vertico :ensure t
  :custom ((vertico-scroll-margin 1 "Scroll on N-1")
           (vertico-count 15 "Show 5 more candidates")
           (vertico-resize t "Grow and shrink the vertico minibufffer")
           (vertico-cycle t "Cycle completion"))
  :config
  (vertico-mode t))

(use-package orderless :ensure t
  :custom ((completion-styles '(orderless partial-completion basic)
                              "Fallback to basic if orderless does not work.")
           (completion-category-defaults nil)
           (completion-category-overrides
            '((file (styles partial-completion))))))


(use-package marginalia :ensure t
  :config (marginalia-mode t))
(use-package consult :ensure t
  :bind (:map icejam-keys-mode-map
              ("C-c t" . find-file)
              ("M-g"   . consult-goto-line)
              ("C-c a" . consult-ripgrep)))
(use-package helpful :ensure t)

(provide 'icejam-completing-read)
;;; icejam-completing-read.el ends here
