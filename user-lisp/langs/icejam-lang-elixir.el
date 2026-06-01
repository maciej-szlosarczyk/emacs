;;; languages/elixir -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(eval-when-compile
  (declare-function -> 'dash)
  (declare-function column-enforce-n 'column-enforce-mode (number))
  (declare-function icejam-set-eglot-capfs 'icejam-complete-at-point)
  (declare-function icejam-set-indent 'icejam-prog-mode)
  (declare-function icejam-start-eglot 'icejam-eglot)
  (declare-function transient-define-prefix 'transient)
  (declare-function yas--remove-template-by-uuid 'yasnippet)
  (declare-function yas--table-get-create 'yasnippet)
  (defvar apheleia-mode-alist)
  (defvar icejam-elixir-lang-menu)
  (defvar icejam-language-transient-alist))

(use-package elixir-ts-mode :ensure t :defer t :after (apheleia)
  :config
  (add-to-list 'apheleia-mode-alist '(heex-ts-mode . mix-format)))

(transient-define-prefix icejam-elixir-lang-menu ()
  [[:description
    (lambda ()
      (concat (propertize "Code actions for " 'face 'transient-heading)
              (propertize (format "%s" major-mode) 'face 'transient-key)
              (propertize ":\n" 'face 'transient-heading)))
    ("m" "iMenu" consult-imenu)
    ("r" "Reload buffer" icejam-revert-buffer-no-confirm)
    ("e" "Show errors" flymake-show-buffer-diagnostics)
    ("f" "Format buffer with Elixir formatter" apheleia-format-buffer)

    ("q" "Quit" keyboard-quit)]])

(defun icejam-delete-elixir-snippets ()
  "This function deletes Elixir snippets I don't use."
  (-> 'elixir-mode
      (yas--table-get-create)
      (yas--remove-template-by-uuid "defmodule XXX end")))

(add-to-list
 'icejam-language-transient-alist '(elixir-ts-mode . icejam-elixir-lang-menu))

(defun icejam-activate-elixir-ts-mode ()
  "All things Elixir."
  (icejam-set-indent 2)
  (column-enforce-n 98)
  (icejam-set-eglot-capfs)
  (icejam-start-eglot)
  (icejam-delete-elixir-snippets))

(add-hook 'heex-ts-mode-hook 'icejam-activate-elixir-ts-mode)
(add-hook 'elixir-ts-mode-hook 'icejam-activate-elixir-ts-mode)

;; (use-package ert :ensure nil :defer t)
;; (ert-deftest icejam-activate-elixir-ts-mode ()
;;   "Test `elixir-ts-mode` activation."
;;   (with-temp-buffer
;;     (elixir-ts-mode)
;;     (icejam-activate-elixir-ts-mode)
;;     (should (eq major-mode 'elixir-ts-mode))
;;     (should (bound-and-true-p column-enforce-mode))
;;     (should (equal " 98col" (buffer-local-value 'column-enforce-mode-line-string
;;                                             (current-buffer))))
;;     (should (eq 2 (buffer-local-value 'tab-width (current-buffer))))))

(provide 'icejam-lang-elixir)
;;; icejam-lang-elixir.el ends here
