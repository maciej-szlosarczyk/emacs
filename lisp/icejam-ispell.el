;;; pkg/ispell -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Highlight misspelled words
;;; Code:

(use-package ispell
  :ensure nil
  :config (setq ispell-program-name "aspell")
  (setq ispell-extra-args
        '("--run-together" "--run-together-limit=5" "--run-together-min=2"))
  :hook ((prog-mode text-mode markdown-mode) . flyspell-mode))

(add-hook 'flyspell-mode-hook (lambda ()
                                (unbind-key "C-," flyspell-mode-map)
                                (unbind-key "C-." flyspell-mode-map)
                                (unbind-key "C-;" flyspell-mode-map)
                                (unbind-key "C-c $" flyspell-mode-map)
                                (unbind-key "C-M-i" flyspell-mode-map)))

(use-package flyspell-correct :ensure t :after flyspell :defer t)
(use-package flyspell-correct-ivy :ensure t :after flyspell-correct :defer t)

(provide 'icejam-ispell)
;;; icejam-ispell.el ends here
