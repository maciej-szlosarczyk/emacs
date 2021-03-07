;;; markdown -- summary
;;; Commentary:
;;; Code:

(require '+custom-pkg-prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")

(use-package markdown-mode
  :straight t
  :defer t
  :init (setq-default markdown-command "pandoc"))

(defun activate-markdown-mode ()
  "Reconfigure markdown mode for your own purposes."
  (set-indent 2)
  (column-enforce-n 10000)

  ;; Markdown mode reuses my bindings, remove them.
  (define-key markdown-mode-map (kbd "C-c <left>") nil)
  (define-key markdown-mode-map (kbd "C-c <right>") nil)
  (define-key markdown-mode-map (kbd "C-c <up>") nil)
  (define-key markdown-mode-map (kbd "C-c <down>") nil)
  (define-key markdown-mode-map (kbd "C-c C-v") 'markdown-preview))

(add-hook 'markdown-mode-hook 'activate-markdown-mode)

(provide '+custom-lang-markdown)
;;; markdown.el ends here
