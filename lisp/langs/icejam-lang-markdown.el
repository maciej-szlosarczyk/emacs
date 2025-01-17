;;; markdown -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(declare-function column-enforce-n 'column-enforce-mode (number))
(declare-function icejam-set-indent 'icejam-prog-mode)

;; Markdown is a dependency of LSP mode. By wrapping it in unless we silence
;; a warning from the byte compiler.
(declare-function elpaca-installed-p "elpaca")
(unless (elpaca-installed-p 'markdown-mode)
  (use-package markdown-mode :ensure t :defer t))

(with-eval-after-load 'markdown-mode
  (setq-default markdown-command "pandoc"))

(declare-function rxt--re-builder-switch-pcre-mode "pcre2el")
(declare-function markdown-preview 'markdown-mode)

(defun icejam-lang-activate-markdown-mode ()
  "Reconfigure markdown mode for your own purposes."
  (icejam-set-indent 2)
  (column-enforce-n 10000)

  ;; Markdown mode reuses my bindings, remove them.
  (keymap-set markdown-mode-map "C-c <left>" nil)
  (keymap-set markdown-mode-map "C-c <right>" nil)
  (keymap-set markdown-mode-map "C-c <up>" nil)
  (keymap-set markdown-mode-map "C-c <down>" nil)
  (keymap-set markdown-mode-map "C-c C-v" #'markdown-preview))

(add-hook 'markdown-mode-hook 'icejam-lang-activate-markdown-mode)
(add-hook 'markdown-mode-hook 'display-line-numbers-mode)

(provide 'icejam-lang-markdown)
;;; icejam-lang-markdown.el ends here
