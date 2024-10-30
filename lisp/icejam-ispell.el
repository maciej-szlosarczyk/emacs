;;; pkg/ispell -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Highlight misspelled words
;;; Code:



(use-package ispell :ensure nil
  :custom
  ((ispell-program-name "aspell")
   (ispell-extra-args '("--run-together" "--run-together-limit=5" "--run-together-min=2"))))

(use-package flyspell :ensure nil
  :hook ((prog-mode . flyspell-mode)
         (text-mode . flyspell-mode)
         (markdown-mode . flyspell-mode))
  :config
  (unbind-key "C-," flyspell-mode-map)
  (unbind-key "C-." flyspell-mode-map)
  (unbind-key "C-;" flyspell-mode-map)
  (unbind-key "C-c $" flyspell-mode-map)
  (unbind-key "C-M-i" flyspell-mode-map))

(use-package flyspell-correct :ensure t :after flyspell :defer t)
(provide 'icejam-ispell)
;;; icejam-ispell.el ends here
