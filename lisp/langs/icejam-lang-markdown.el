;;; markdown -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(eval-when-compile
  (declare-function elpaca-installed-p "elpaca")
  (declare-function column-enforce-n 'column-enforce-mode (number))
  (declare-function icejam-set-indent 'icejam-prog-mode)
  (declare-function icejam-set-no-lsp-capfs 'icejam-prog-mode)
  (declare-function rxt--re-builder-switch-pcre-mode "pcre2el"))

;; Markdown is a dependency of LSP mode. By wrapping it in unless we silence
;; a warning from the byte compiler.
(unless (elpaca-installed-p 'markdown-mode)
  (use-package markdown-mode :ensure t :defer t
    :commands (markdown-preview)
    :config
    ;; Render preview and open it in browser.
    (keymap-set markdown-mode-map "C-c C-v" #'markdown-preview)

    ;; Render HTML preview with pandoc
    (setq-default markdown-command '("pandoc"
                                     "-f"
                                     "markdown"
                                     "-t"
                                     "html5"
                                     "--template"
                                     "github.html5"
                                     "--highlight-style"
                                     "pygments"))))

(defun icejam-lang-activate-markdown-mode ()
  "Reconfigure markdown mode for your own purposes."
  (icejam-set-indent 2))

(add-hook 'markdown-mode-hook 'icejam-lang-activate-markdown-mode)
(add-hook 'markdown-mode-hook 'display-line-numbers-mode)

(provide 'icejam-lang-markdown)
;;; icejam-lang-markdown.el ends here
