;;; icejam-flycheck -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Use flycheck checks with flymake.
(use-package flymake-flycheck :ensure t :defer t :config
  (setq-default
   flycheck-disabled-checkers
   (append (default-value 'flycheck-disabled-checkers)
           '(emacs-lisp emacs-lisp-checkdoc emacs-lisp-package sh-shellcheck))))

(eval-when-compile
  (declare-function flymake--project-diagnostics-buffer 'flymake)
  (declare-function flymake--diagnostics-buffer-name 'flymake)
  (declare-function flymake-project-diagnostics-mode 'flymake)
  (declare-function flymake-diagnostics-buffer-mode 'flymake)
  (declare-function cape-capf-super 'cape)
  (declare-function cape-dabbrev 'cape)
  (declare-function cape-file 'cape)
  (declare-function cape-keyword 'cape)
  (declare-function yasnippet-capf 'yasnippet-capf))

(use-package el-patch :ensure t :defer t
  :config
  ;; Show the diagnostics from flymake in a second window (usually on the
  ;; opposite side from this one) instead of at the bottom of the current one.
  ;; Essentially revert the interesting part of this commit:
  ;; https://github.com/emacs-mirror/emacs/commit/419550c7907275bf962986e1cc8fba1989d8659c
  (el-patch-feature 'flymake)
  (with-eval-after-load 'flymake
    (el-patch-defun flymake-show-project-diagnostics ()
      "Show a list of Flymake diagnostics for the current project."
      (interactive)
      (let* ((prj (project-current))
             (root (project-root prj))
             (buffer (flymake--project-diagnostics-buffer root)))
        (with-current-buffer buffer
          (flymake-project-diagnostics-mode)
          (setq-local flymake--project-diagnostic-list-project prj)
          (display-buffer (current-buffer))
          (revert-buffer))))

    (el-patch-defun flymake-show-buffer-diagnostics ()
      "Show a list of Flymake diagnostics for current buffer."
      (interactive)
      (unless flymake-mode
        (user-error "Flymake mode is not enabled in the current buffer"))
      (let* ((name (flymake--diagnostics-buffer-name))
             (source (current-buffer))
             (target (or (get-buffer name)
                         (with-current-buffer (get-buffer-create name)
                           (flymake-diagnostics-buffer-mode)
                           (current-buffer)))))
        (with-current-buffer target
          (setq flymake--diagnostics-buffer-source source)
          (display-buffer (current-buffer))
          (revert-buffer))))))

;; Use flymake, the built in linter/checker.
(use-package flymake :ensure nil
  :defer t
  :config
  ;; Show 'Fly' in mode line.
  (setopt flymake-mode-line-lighter "Fly")
  ;; Use the same load-path as normal configuration. This makes the errors that
  ;; appear in elisp files less jarring.
  (setopt elisp-flymake-byte-compile-load-path load-path)
  :hook ((prog-mode . flymake-mode)
         (text-mode . flymake-mode)
         (flymake-mode . flymake-flycheck-auto)))

(provide 'icejam-flycheck)
;;; icejam-flycheck.el ends here
