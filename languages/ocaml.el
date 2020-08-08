;;; ocaml -- summary
;;; Commentary:
;;; Code:

(use-package tuareg
  :defer t
  :ensure t
  :config
  (add-hook 'tuareg-mode-hook 'merlin-mode))

(use-package merlin
  :defer t
  :ensure t)

(use-package reason-mode
  :defer t
  :ensure t
  :config (setq refmt-command 'opam))

(use-package dune
  :defer t
  :ensure t)

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
      (setq merlin-command 'opam))))

;; OCaml setup
(add-hook 'tuareg-mode-hook 'merlin-mode)
(add-hook 'tuareg-mode-hook 'load-ocaml-site-packages)

;; Reason setup
(add-hook 'reason-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'refmt-before-save)))
(add-hook 'reason-mode-hook 'merlin-mode)

(provide 'languages/ocaml)
;;; ocaml.el ends here
