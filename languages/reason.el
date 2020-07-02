(use-package merlin
  :defer t
  :ensure t)

(use-package reason-mode
  :defer t
  :ensure t
  :config (setq refmt-command 'opam))

(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
  (when (and opam-share (file-directory-p opam-share))
    ;; Register Merlin
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (autoload 'merlin-mode "merlin" nil t nil)
    ;; Use opam switch to lookup ocamlmerlin binary
    (setq merlin-command 'opam)))

(add-hook 'reason-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'refmt-before-save)))
(add-hook 'reason-mode-hook 'merlin-mode)