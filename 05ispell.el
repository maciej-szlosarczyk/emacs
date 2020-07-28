;;; 05ispell -- summary
;;; Commentary:
;;; Highlight misspelled words
;;; Code:

(use-package ispell
  :ensure t
  :config (setq ispell-program-name "aspell")
          (setq ispell-extra-args
                '("--run-together" "--run-together-limit=5" "--run-together-min=2"))
          :hook ((prog-mode text-mode) . flyspell-mode))

(provide '05ispell)
;;; 05ispell.el ends here