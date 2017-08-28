;;; spelling.el -- summary
;;; Commentary:

;;; Code:

;; Disable meta on right alt (useful for Polish characters)
(setq ns-right-alternate-modifier nil)

(require 'ispell)
;; Highlight misspelled words
(setq ispell-program-name "aspell")
(setq ispell-extra-args
      '("--run-together" "--run-together-limit=5" "--run-together-min=2"))
(add-hook 'prog-mode-hook 'flyspell-mode)

(provide 'spelling)

;;; spelling.el ends here
