(use-package clojure-mode
	:defer t
	:ensure t)

(use-package cider
  :requires clojure-mode
  :commands cider-jack-in
  :defer t
  :ensure t)

(defun activate-clojure-mode ()
  "Goodies for clojure files."
  (set-indent 2) ;; Default indentation of 2 characters
  (column-enforce-n 80)
  )

(add-hook 'clojure-mode-hook 'activate-clojure-mode)
(add-hook 'clojure-mode-hook 'cider-mode)
