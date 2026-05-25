;;; icejam-diminish.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; diminish minor modes to remove modeline litter.

;;; Code:
(use-package diminish :ensure t :defer t :commands (diminish))

(defun icejam-diminish-modes ()
  "Diminish selected modes."
  (dolist (package-and-mode '((flyspell flyspell-mode)
                              (flycheck flycheck-mode)
                              (rainbow-mode rainbow-mode)
                              (undo-tree undo-tree-mode)
                              (which-key which-key-mode)
                              (eldoc eldoc-mode)
                              (yasnippet yas-minor-mode)
                              (whitespace whitespace-mode)
                              (autorevert auto-revert-mode)
                              (ivy ivy-mode)
                              (smerge-mode smerge-mode)
                              (gcmh gcmh-mode)))
    (let ((package (car package-and-mode))
          (mode (car (last package-and-mode))))
      (with-eval-after-load package (diminish mode)))))

(add-hook 'elpaca-after-init-hook 'icejam-diminish-modes)

(provide 'icejam-diminish)
;;; icejam-diminish.el ends here
