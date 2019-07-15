(defmacro -> (&rest body)
  "Clojure ->  macro for BODY."
  (let ((result (pop body)))
    (dolist (form body result)
      (setq result (append (list (car form) result)
                           (cdr form))))))
