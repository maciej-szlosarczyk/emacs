;;; pkg/company-yasnippet -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Company completion framework configuration
;;; Code:

(use-package yasnippet
  :straight t
  :defer t)

(use-package yasnippet-snippets
  :straight t
  :defer t
  :config
  (unbind-key "C-c & C-n" yas-minor-mode-map)
  (unbind-key "C-c & C-s" yas-minor-mode-map)
  (unbind-key "C-c & C-v" yas-minor-mode-map))

(use-package company
  :commands (company-indent-or-complete-common company-yasnippet)
  :requires (yasnippet
             yasnippet-snippets)
  :straight t
  :defer t)

(global-company-mode t)
(yas-global-mode t)

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

(defun insert-space-and-complete ()
  "Insert space before trying to complete a section."
  (interactive)
  (save-excursion
    (insert " "))
  (company-indent-or-complete-common))

;;; Yasnippet configuration
(define-key prog-mode-map (kbd "C-c y") 'company-yasnippet)
(define-key prog-mode-map (kbd "<f13>") 'insert-space-and-complete)
(define-key prog-mode-map (kbd "TAB") 'company-indent-or-complete-common)

(define-key text-mode-map (kbd "C-c y") 'company-yasnippet)
(define-key text-mode-map (kbd "<f13>") 'insert-space-and-complete)
(define-key text-mode-map (kbd "TAB") 'company-indent-or-complete-common)

(provide '+custom-pkg-company-yasnippet)
;;; company-yasnippet.el ends here
