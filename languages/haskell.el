;;; Haskell -- summary
;;; Commentary:

;;; Code:
;;========== Editor config =========================
(defun editor-config-haskell ()
  "Editor configuration for Haskell."
  (set-indent 4)
  (set-width-80))

;;========== Code completion =======================
(defun completion-config-haskell ()
  "Code completion and inspection for Javascript."
  (company-mode 1)
  (flycheck-mode 1)
  (flymake-mode 1)
  (set (make-local-variable 'company-backends)
       '((company-ghc company-capf company-etags company-dabbrev-code
                        company-yasnippet company-files))))

:;========== Scion mode ============================
;; (defun scion-config-haskell ()
;;   "Configuration for scion mode."
;;   (scion-mode 1))

;;========== Hooks =================================
(add-hook 'haskell-mode-hook 'editor-config-haskell)
(add-hook 'haskell-mode-hook 'completion-config-haskell)
;; (add-hook 'haskell-mode-hook 'scion-config-haskell)

(provide 'haskell)
;;; haskell.el ends here
