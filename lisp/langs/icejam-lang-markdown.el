;;; markdown -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)
(declare-function elpaca-installed-p "elpacs")
(unless (elpaca-installed-p 'markdown-mode)
  (use-package markdown-mode :ensure t))

(with-eval-after-load 'markdown-mode
  (setq-default markdown-command "pandoc"))

(defun icejam-lang-activate-markdown-mode ()
  "Reconfigure markdown mode for your own purposes."
  (icejam-set-indent 2)
  (column-enforce-n 10000)

  ;; Markdown mode reuses my bindings, remove them.
  (define-key markdown-mode-map (kbd "C-c <left>") nil)
  (define-key markdown-mode-map (kbd "C-c <right>") nil)
  (define-key markdown-mode-map (kbd "C-c <up>") nil)
  (define-key markdown-mode-map (kbd "C-c <down>") nil)
  (define-key markdown-mode-map (kbd "C-c C-v") 'markdown-preview))

(add-hook 'markdown-mode-hook 'icejam-lang-activate-markdown-mode)
(add-hook 'markdown-mode-hook 'display-line-numbers-mode)

(provide 'icejam-lang-markdown)
;;; icejam-lang-markdown.el ends here
