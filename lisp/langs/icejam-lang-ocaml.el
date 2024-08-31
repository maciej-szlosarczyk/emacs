;;; ocaml -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-transient)
(require 'icejam-prog-mode)
(declare-function lsp "lsp-mode" nil)

(use-package merlin :defer t :straight t)
(use-package opam-switch-mode :straight t :defer t)
(use-package dune :defer t :straight t)
(use-package tuareg
  :defer t
  :straight t
  :config (add-hook 'tuareg-mode-hook 'merlin-mode))

(transient-define-prefix icejam/ocaml-lang-menu ()
  "Ocaml Actions."
  ["OCaml actions"
   [""
    ("r" "Reload"   icejam-revert-buffer-no-confirm)
    ("i" "Indent"   icejam-mark-and-indent-whole-buffer)]
   [""
    ("f" "Format"   lsp-format-buffer)
    ("e" "Errors"   flycheck-list-errors)
    ("o" "Opam Env" opam-switch-set-switch)]]
  [""
   ("q" "Quit"      keyboard-quit)])

(add-to-list 'icejam-language-transient-alist '(tuareg-mode . icejam/ocaml-lang-menu))

(defun icejam/load-ocaml-site-packages ()
  "Generate ocaml config."
  (let ((opam-share (ignore-errors (car (process-lines "opam" "var" "share")))))
    (when (and opam-share (file-directory-p opam-share))
      ;; Register Merlin
      (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
      (autoload 'merlin-mode "merlin" nil t nil)
      (autoload 'utop "utop" nil t nil)
      (autoload 'dune "dune" nil t nil)

      ;; Use opam switch to lookup ocamlmerlin binary
      (setq merlin-command 'opam))))

;; OCaml setup
(defun icejam/activate-tuareg-mode ()
  "All thing OCaml."
  (icejam/set-indent 2)
  (opam-switch-mode t)
  (icejam/load-ocaml-site-packages)
  (lsp))

(add-hook 'tuareg-mode-hook 'icejam/activate-tuareg-mode)

;; Disable merlin keys that are unused by me
(add-hook 'merlin-mode-hook (lambda ()
                              (unbind-key "C-c C-d" merlin-mode-map)
                              (unbind-key "C-c C-l" merlin-mode-map)
                              (unbind-key "C-c C-n" merlin-mode-map)
                              (unbind-key "C-c C-p" merlin-mode-map)
                              (unbind-key "C-c C-r" merlin-mode-map)
                              (unbind-key "C-c C-t" merlin-mode-map)
                              (unbind-key "C-c C-x" merlin-mode-map)
                              (unbind-key "C-c &" merlin-mode-map)))

;; Use tuareg-opam with lock files
(add-to-list 'auto-mode-alist '("\\.opam.locked\\'" . tuareg-opam-mode))

;; (transient-define-prefix icejam-lang/reasonml-context-menu ()
;;   "ReasonML Actions."
;;   ["ReasonML actions"
;;    [""
;;     ("r" "Reload"   icejam-revert-buffer-no-confirm)
;;     ("i" "Indent"   icejam-mark-and-indent-whole-buffer)]
;;    [""
;;     ("f" "Format"   refmt)
;;     ("e" "Opam Env" opam-switch-set-switch)]]
;;   [""
;;    ("q" "Quit"      keyboard-quit)])


;; (defun icejam-lang/activate-reason-mode ()
;;   "Generate reason config."
;;   (define-key
;;     reason-mode-map (kbd "C-c l") 'icejam-lang/reasonml-context-menu))

;; ;; Reason setup
;; (add-hook 'reason-mode-hook
;;           (lambda ()
;;             (add-hook 'before-save-hook #'refmt-before-save)))
;; (add-hook 'reason-mode-hook 'icejam-lang/activate-reason-mode)
;; (add-hook 'reason-mode-hook 'merlin-mode)

(provide 'icejam-lang-ocaml)
;;; icejam-lang-ocaml.el ends here
