;;; icejam-treesitter.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Load treesitter grammars automatically, based on the grammars provided by the
;; community.

;;; Code:

(use-package tree-sitter-langs :ensure t
  :config
  (declare-function tree-sitter-langs--bin-dir "tree-sitter-langs")
  (add-to-list 'treesit-extra-load-path (tree-sitter-langs--bin-dir))

  (defun icejam-tree-sitter-symlink-grammar-objects ()
    "Create symlinks for treesitter grammars.
Tree-sitter-langs-build releases grammars as LANG.so. Treesit needs
libtree-sitter-LANG.so"
    (interactive)
    (dolist (file (directory-files (tree-sitter-langs--bin-dir) 'full
                                   (concat "\\" (car tree-sitter-load-suffixes) "$")))
      ;; make symlink (or copy) libtree-sitter-c.so -> c.so
      (let ((target (concat (file-name-as-directory (file-name-directory file))
                            "libtree-sitter-"
                            (file-name-nondirectory file))))
        (if (memq system-type '(ms-dos windows-nt cygwin))
            (copy-file file target)
          (make-symbolic-link file target))))))

(provide 'icejam-tree-sitter)
;;; icejam-tree-sitter.el ends here
