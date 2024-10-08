;;; ocaml -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-transient)

(use-package tuareg
  :defer t
  :straight t
  :config
  (add-hook 'tuareg-mode-hook 'merlin-mode))

(use-package merlin
  :defer t
  :straight t)

(use-package reason-mode
  :defer t
  :straight t
  :config (setq refmt-command 'opam))

(use-package dune
  :defer t
  :straight t)

(transient-define-prefix icejam-lang-ocaml/context-menu ()
  "Ocaml Actions."
  ["OCaml actions"
   [""
    ("r" "Reload"   icejam-revert-buffer-no-confirm)
    ("i" "Indent"   icejam-mark-and-indent-whole-buffer)]
   [""
    ("f" "Format"   ocamlformat)
    ("e" "Opam Env" tuareg-opam-update-env)]]
  [""
   ("q" "Quit"      keyboard-quit)])

(add-to-list
 'icejam-language-transient-alist '(elixir-ts-mode . icejam/elixir-lang-menu))

(defun icejam/load-ocaml-site-packages ()
  "Generate ocaml config."
  (let ((opam-share (ignore-errors (car (process-lines "opam" "var" "share")))))
    (when (and opam-share (file-directory-p opam-share))
      ;; Register Merlin
      (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
      (autoload 'merlin-mode "merlin" nil t nil)
      (autoload 'ocamlformat "ocamlformat" nil t nil)
      (autoload 'utop "utop" nil t nil)
      (autoload 'dune "dune" nil t nil)

      ;; Use opam switch to lookup ocamlmerlin binary
      (setq merlin-command 'opam))))

;; OCaml setup
(add-hook 'tuareg-mode-hook 'merlin-mode)
(add-hook 'tuareg-mode-hook 'icejam/load-ocaml-site-packages)
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

(transient-define-prefix icejam-lang/reasonml-context-menu ()
  "ReasonML Actions."
  ["ReasonML actions"
   [""
    ("r" "Reload"   icejam-revert-buffer-no-confirm)
    ("i" "Indent"   icejam-mark-and-indent-whole-buffer)]
   [""
    ("f" "Format"   refmt)
    ("e" "Opam Env" tuareg-opam-update-env)]]
  [""
   ("q" "Quit"      keyboard-quit)])


(defun icejam-lang/activate-reason-mode ()
  "Generate reason config."
  (define-key
    reason-mode-map (kbd "C-c l") 'icejam-lang/reasonml-context-menu))

;; Reason setup
(add-hook 'reason-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'refmt-before-save)))
(add-hook 'reason-mode-hook 'icejam-lang/activate-reason-mode)
(add-hook 'reason-mode-hook 'merlin-mode)

(provide 'icejam-lang-ocaml)
;;; icejam-lang-ocaml.el ends here
