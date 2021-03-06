;;; pkg/ispell -- summary
;;; Commentary:
;;; Highlight misspelled words
;;; Code:

(use-package ispell
  :straight t
  :config (setq ispell-program-name "aspell")
  (setq ispell-extra-args
        '("--run-together" "--run-together-limit=5" "--run-together-min=2"))
  :hook ((prog-mode text-mode) . flyspell-mode))

(add-hook 'flyspell-mode-hook (lambda ()
                                (unbind-key "C-," flyspell-mode-map)
                                (unbind-key "C-." flyspell-mode-map)
                                (unbind-key "C-;" flyspell-mode-map)
                                (unbind-key "C-c $" flyspell-mode-map)
                                (unbind-key "C-M-i" flyspell-mode-map)))

(provide 'icejam-pkg-ispell)
;;; ispell.el ends here
