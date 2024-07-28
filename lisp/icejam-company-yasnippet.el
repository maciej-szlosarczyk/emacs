;;; icejam-company-yasnippet.el -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Company completion framework configuration
;;; Code:

(use-package yasnippet
  :straight t
  :defer t)

(use-package yasnippet-snippets
  :straight t
  :defer t
  :requires (yasnippet)
  :config
  (unbind-key "C-c & C-n" yas-minor-mode-map)
  (unbind-key "C-c & C-s" yas-minor-mode-map)
  (unbind-key "C-c & C-v" yas-minor-mode-map))

(yas-global-mode t)

(use-package company
  :commands (company-indent-or-complete-common company-yasnippet)
  :requires (yasnippet
             yasnippet-snippets)
  :straight t
  :defer t)

(use-package company-box
  :straight t
  :defer t
  :requires (company)
  :hook (((company-mode) . company-box-mode)))

(global-company-mode t)

(setq-default
 company-minimum-prefix-length 3   ;; minimum prefix character number for auto complete.
 company-idle-delay 0.1
 company-require-match nil
 company-echo-delay 0 ;;;; company-show-numbers t
 company-tooltip-align-annotations t ;; align annotations to the right tooltip border.
 company-tooltip-flip-when-above t
 company-tooltip-limit 10          ;; tooltip candidates max limit.
 company-tooltip-minimum 2         ;; minimum candidates limit.
 company-tooltip-minimum-width 10  ;; The minimum width of the tooltip's inner area.
                                   ;; This doesn't include the margins and the scroll bar.
 company-tooltip-margin 2          ;; width of margin columns to show around the tooltip
 company-tooltip-offset-display 'lines ;; 'lines - how to show tooltip unshown candidates number.
 company-show-numbers nil ;; t: show quick-access numbers for the first ten candidates.
 company-selection-wrap-around t ;; loop over candidates
 company-dabbrev-other-buffers t ;; Only offer dabbrev from the same major mode
 company-dabbrev-downcase nil ;; Preserve case of candidates
 company-format-margin-function nil
 ;; company-async-wait 0.03
 ;; company-async-timeout 2
 )

;; Absolute defaults for company mode
(setq company-backends
      '((company-files          ; files & directory
         company-keywords       ; keywords
         company-capf
         )
        (company-dabbrev company-abbrev)
        ))

;; Use standard emacs next and previous bindings for navigating company
;; suggestions
(define-key company-active-map (kbd "C-p") 'company-select-previous-or-abort)
(define-key company-active-map (kbd "C-n") 'company-select-next-or-abort)

(defun icejam/insert-space-and-complete ()
  "Insert space before trying to complete a section."
  (interactive)
  (save-excursion
    (insert " "))
  (company-indent-or-complete-common))

;; Only use RETURN for completion in company
(unbind-key "TAB" company-active-map)

;;; Yasnippet configuration
(define-key prog-mode-map (kbd "C-c y") 'company-yasnippet)
(define-key prog-mode-map (kbd "<f13>") 'icejam/insert-space-and-complete)
(define-key prog-mode-map (kbd "TAB") 'company-indent-or-complete-common)

(define-key text-mode-map (kbd "C-c y") 'company-yasnippet)
(define-key text-mode-map (kbd "<f13>") 'icejam/insert-space-and-complete)
(define-key text-mode-map (kbd "TAB") 'company-indent-or-complete-common)


;;; Copilot and other GPT stuff
(use-package copilot
  :straight (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
  :ensure t)

;; Do not enable copilot by default because it sorta sucks?
;; (add-hook 'prog-mode-hook 'copilot-mode)
(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)

;; Enable Anthropic Claude LLM support for chat (it also sucks)
(use-package gptel :straight t :ensure t)

(defcustom anthropic-api-key "api-key" "The value of your Anthropic API key."
  :type 'string
  :initialize 'custom-initialize-set)

(setq
 gptel-model "claude-3-5-sonnet-20240620"
 gptel-backend (gptel-make-anthropic "Claude" :stream t :key (lambda () anthropic-api-key)))

(provide 'icejam-company-yasnippet)
;;; icejam-company-yasnippet.el ends here
