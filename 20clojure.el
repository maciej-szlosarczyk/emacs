(add-hook 'clojure-mode-hook 'cider-mode)

(defun activate-clojure-mode ()
  "Goodies for clojure files."
  (set-indent 2) ;; Default indentation of 2 characters
  (column-enforce-n 80)
  )

(add-hook 'clojure-mode-hook 'activate-clojure-mode)
