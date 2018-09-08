(require 'ispell)
;; Highlight misspelled words
(setq ispell-program-name "aspell")
(setq ispell-extra-args
      '("--run-together" "--run-together-limit=5" "--run-together-min=2"))
(add-hook 'prog-mode-hook 'flyspell-mode)
