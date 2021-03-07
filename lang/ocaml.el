;;; ocaml -- summary
;;; Commentary:
;;; Code:

(require 'icejam-pkg-hydra "$HOME/.emacs.d/pkg/hydra.el")

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


(defhydra my-ocaml/context-hydra (:color teal :hint nil)
  "
^                                   OCaml actions
^^^^^^^^--------------------------------------------------------------------------------------------
Buffer: _r_: Reload   _f_: Format _i_: Indent
Other:  _o_: Opam env
^^
"
  ("q" nil "cancel" :color blue)

  ("r" revert-buffer-no-confirm)
  ("i" mark-and-indent-whole-buffer)
  ("f" ocamlformat)
  ("o" tuareg-opam-update-env))

(defun load-ocaml-site-packages ()
  "Generate ocaml config."
  (let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
    (when (and opam-share (file-directory-p opam-share))
      ;; Register Merlin
      (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
      (autoload 'merlin-mode "merlin" nil t nil)
      (autoload 'ocamlformat "ocamlformat" nil t nil)
      (autoload 'utop "utop" nil t nil)
      (autoload 'dune "dune" nil t nil)

      ;; Use opam switch to lookup ocamlmerlin binary
      (setq merlin-command 'opam)))
  (define-key tuareg-mode-map (kbd "C-c l") 'my-ocaml/context-hydra/body))

;; OCaml setup
(add-hook 'tuareg-mode-hook 'merlin-mode)
(add-hook 'tuareg-mode-hook 'load-ocaml-site-packages)
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

(defhydra my-reason/context-hydra (:color teal :hint nil)
  "
  Reason actions

   ^Reason^                          ^Actions^
^^^^^^^^-----------------------------------------------------------------------
_f_: Format buffer
_o_: Update opam env
"
  ("q" nil "cancel" :color blue)

  ("f" refmt)
  ("o" tuareg-opam-update-env))

(defun my-reason-mode ()
  "Generate reason config."
  (define-key reason-mode-map (kbd "C-c l") 'my-reason/context-hydra/body))

;; Reason setup
(add-hook 'reason-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'refmt-before-save)))
(add-hook 'reason-mode-hook 'my-reason-mode)
(add-hook 'reason-mode-hook 'merlin-mode)

(provide 'icejam-lang-ocaml)
;;; ocaml.el ends here
