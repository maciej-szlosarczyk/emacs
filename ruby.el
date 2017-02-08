(add-hook 'ruby-mode-hook
  (aggressive-indent-mode))

(add-hook 'yaml-mode-hook
  (lambda () (indent-guide-mode -1)))

(add-hook 'sql-mode-hook
  (lambda () (indent-guide-mode -1)))

(defun align-to-colon (begin end)
  "Align region to colon (:) signs"
  (interactive "r")
  (align-regexp begin end
                (rx ":" (group (zero-or-more (syntax whitespace))) ) 1 1 ))

;; Do not align 'begin' and 'while' ;;
(setq ruby-align-to-stmt-keywords '(if begin case elseif rescue))

;; Do not indent inside the parenthasis
(setq ruby-deep-indent-paren nil)

;; Do not insert encoding comments ;;
(setq ruby-insert-encoding-magic-comment nil)
