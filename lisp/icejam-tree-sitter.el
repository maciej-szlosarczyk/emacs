;;; icejam-treesitter.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Load treesitter grammars automatically
;;; Code:

(defun icejam-tree-sitter-symlink-grammar-objects ()
  "Tree-sitter-langs-build releases grammars as LANG.so, but treesit needs libtree-sitter-LANG.so."
  (dolist (file (directory-files (tree-sitter-langs--bin-dir) 'full
                                 (concat "\\" (car tree-sitter-load-suffixes) "$")))
    ;; make symlink (or copy) libtree-sitter-c.so -> c.so
    (let ((target (concat (file-name-as-directory (file-name-directory file))
                                "libtree-sitter-"
                                (file-name-nondirectory file))))
      (if (memq system-type '(ms-dos windows-nt cygwin))
          (copy-file file target)
        (make-symbolic-link file target)))))

;;;;;;;;;;;;;;;;;;;;;; Tree sitter ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package tree-sitter-langs :ensure t
  :config
  (add-to-list 'treesit-extra-load-path (tree-sitter-langs--bin-dir)))

;; (use-package tree-sitter-indent :ensure t)
(add-hook 'tree-sitter-after-on-hook 'tree-sitter-hl-mode)

(provide 'icejam-tree-sitter)
;;; icejam-tree-sitter.el ends here
