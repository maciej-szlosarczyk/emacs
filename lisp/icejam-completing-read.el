;;; icejam-completing-read -- Functions related to completing-read -*- lexical-binding: t; -*-
;;; Commentary:
;;;
;;; completing-read is the way of completing things in minibuffer.  This module
;;; provides all of that functionality, everything related to minbuffer being helpful.
;;;
;;; Code:

(require 'icejam-keys-mode)

;; Preparations for using Vertico/Orderless
(setopt
 ;; Support opening new minibuffers from inside existing minibuffers.
 enable-recursive-minibuffers t
 ;; Hide commands in M-x which do not work in the current mode.  Vertico
 ;; commands are hidden in normal buffers. This setting is useful beyond
 ;; Vertico.
 read-extended-command-predicate #'command-completion-default-include-p
 ;; Do not allow the cursor in the minibuffer prompt
 minibuffer-prompt-properties
 '(read-only t cursor-intangible t face minibuffer-prompt))

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
  :config
  (setopt vertico-scroll-margin 1) ;; Scroll on N-1
  (setopt vertico-count 15)        ;; Show 5 more candidates
  (setopt vertico-resize t) ;; Grow and shrink the vertico minibufffer
  (setopt vertico-cycle t)  ;; Cycle completion

  (declare-function vertico-mode "vertico")
  (vertico-mode t))

(use-package orderless :ensure t
  :config
  (setopt completion-styles '(orderless partial-completion basic)) ;; Fallback to basic if orderless does not work.
  (setopt completion-category-defaults nil)
  (setopt completion-category-overrides '((file (styles partial-completion)))))


(use-package marginalia :ensure t
  :config
  (declare-function marginalia-mode "marginalia")
  (marginalia-mode t))

(use-package consult :ensure t
  :config
  ;; Using ripgrep, show hidden files but ignore contents of .git
  (setopt consult-ripgrep-args
          "rg --null --line-buffered --color=never --max-columns=1000 \
--path-separator / --smart-case --no-heading --with-filename --line-number \
--search-zip --hidden --glob \"!.git/*\"")
  :bind (:map icejam-keys-mode-map
              ("C-c t" . find-file)
              ("M-g"   . consult-goto-line)
              ("C-c a" . consult-ripgrep)))

(use-package helpful :ensure t)

(provide 'icejam-completing-read)
;;; icejam-completing-read.el ends here
