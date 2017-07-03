;;; spelling.el -- summary
;;; Commentary:

;;; Code:

;; Disable meta on right alt (useful for Polish characters)
(setq ns-right-alternate-modifier nil)

;; Highlight misspelled words
(setq ispell-program-name "aspell")
(flyspell-mode 1)
(provide 'spelling)

;;; spelling.el ends here
