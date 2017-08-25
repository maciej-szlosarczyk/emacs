;;; spelling.el -- summary
;;; Commentary:

;;; Code:

;; Disable meta on right alt (useful for Polish characters)
(setq ns-right-alternate-modifier nil)

(require 'ispell)
;; Highlight misspelled words
(setq ispell-program-name "aspell")
(add-hook 'prog-mode-hook 'flyspell-mode)
(provide 'spelling)

;;; spelling.el ends here
