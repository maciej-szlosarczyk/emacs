;;; windows.el -- summary
;;; Commentary:
;;; Windows management things, mostly with purpose
;;; Code:
(purpose-mode t)

(add-to-list 'purpose-user-regexp-purposes '("_spec.rb\\(<.*>\\)?$" . test))
(add-to-list 'purpose-user-mode-purposes '(ruby-mode . edit))
(add-to-list 'purpose-user-mode-purposes '(yaml-mode . edit))
(add-to-list 'purpose-user-mode-purposes '(emacs-lisp-mode . edit))
(add-to-list 'purpose-user-mode-purposes '(web-mode . edit))
(add-to-list 'purpose-user-mode-purposes '(html-mode . edit))
(add-to-list 'purpose-user-mode-purposes '(scss-mode . test))
(add-to-list 'purpose-user-mode-purposes '(css-mode . test))
(add-to-list 'purpose-user-mode-purposes '(javascript-mode . edit))
(add-to-list 'purpose-user-mode-purposes '(magit-mode . tr))
(add-to-list 'purpose-user-mode-purposes '(dired-mode . tr))
(add-to-list 'purpose-user-mode-purposes '(compilation-mode . tr))
(add-to-list 'purpose-user-mode-purposes '(help-mode . br))
(add-to-list 'purpose-user-mode-purposes '(special-mode . br))


(setq purpose-use-default-configuration nil)
(purpose-compile-user-configuration)

;;; windows.el ends here
