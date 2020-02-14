(use-package markdown-mode
  :ensure t
  :defer t)

(defun activate-markdown-mode ()
  "Reconfigure markdown mode for your own purposes."
  (set-indent 2)
  (column-enforce-n 80)

  ;; Markdown mode reuses my bindings, remove them.
  (define-key markdown-mode-map (kbd "C-c <left>") nil)
  (define-key markdown-mode-map (kbd "C-c <right>") nil)
  (define-key markdown-mode-map (kbd "C-c <up>") nil)
  (define-key markdown-mode-map (kbd "C-c <down>") nil))

(add-hook 'markdown-mode-hook 'activate-markdown-mode)
