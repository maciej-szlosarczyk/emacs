;; Company completion framework configuration
(use-package yasnippet
  :ensure t
  :defer t)

(use-package yasnippet-snippets
  :ensure t
  :defer t)

(use-package lsp-mode
  :ensure t
  :defer t)

(use-package lsp-ui)

(use-package company
  :commands (company-indent-or-complete-common company-yasnippet)
  :requires (yasnippet
             yasnippet-snippets
             lsp-mode
             lsp-ui)
  :ensure t
  :defer t)

(use-package company-lsp
  :ensure t
  :requires company
  :defer t)

(global-company-mode t)
(yas-global-mode t)

(setq-default
 company-minimum-prefix-length 2   ; minimum prefix character number for auto complete.
 company-idle-delay 0.1
 company-echo-delay 0 ;; company-show-numbers t
 company-tooltip-align-annotations t ; align annotations to the right tooltip border.
 company-tooltip-flip-when-above t
 company-tooltip-limit 10          ; tooltip candidates max limit.
 company-tooltip-minimum 2         ; minimum candidates limit.
 company-tooltip-minimum-width 10  ; The minimum width of the tooltip's inner area.
                                        ; This doesn't include the margins and the scroll bar.
 company-tooltip-margin 2          ; width of margin columns to show around the tooltip
 company-tooltip-offset-display 'lines ; 'lines - how to show tooltip unshown candidates number.
 company-show-numbers nil ; t: show quick-access numbers for the first ten candidates.
 company-selection-wrap-around t ; loop over candidates
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

(setq-default
 company-lsp-cache-candidates 1 ;; Cache LSP results
 company-lsp-async 1 ;; Fetch LSP results asynchronously
 )

;; Use standard emacs next and previous bindings for navigating company
;; suggestions
(define-key company-active-map (kbd "C-p") 'company-select-previous-or-abort)
(define-key company-active-map (kbd "C-n") 'company-select-next-or-abort)

;;; Yasnippet configuration
(define-key prog-mode-map (kbd "C-c y") 'company-yasnippet)
(define-key prog-mode-map (kbd "<f13>") 'company-indent-or-complete-common)
(define-key prog-mode-map (kbd "TAB") 'company-indent-or-complete-common)

(define-key text-mode-map (kbd "C-c y") 'company-yasnippet)
(define-key text-mode-map (kbd "<f13>") 'company-indent-or-complete-common)
(define-key text-mode-map (kbd "TAB") 'company-indent-or-complete-common)
