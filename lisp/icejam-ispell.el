;;; pkg/ispell -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Highlight misspelled words
;;; Code:

(use-package ispell :ensure nil)
(use-package flyspell-correct :ensure t :after flyspell :defer t)
(use-package flyspell-correct-ivy :ensure t :after flyspell-correct :defer t)

(with-eval-after-load 'ispell
  (setq
   ispell-program-name "aspell"
   ispell-extra-args '("--run-together" "--run-together-limit=5" "--run-together-min=2"))
  (add-hook 'prog-mode-hook #'flyspell-mode)
  (add-hook 'text-mode-hook #'flyspell-mode)
  (add-hook 'markdown-mode-hook #'flyspell-mode)
  (add-hook 'flyspell-mode-hook (lambda ()
                                  (unbind-key "C-," flyspell-mode-map)
                                  (unbind-key "C-." flyspell-mode-map)
                                  (unbind-key "C-;" flyspell-mode-map)
                                  (unbind-key "C-c $" flyspell-mode-map)
                                  (unbind-key "C-M-i" flyspell-mode-map))))

(provide 'icejam-ispell)
;;; icejam-ispell.el ends here
