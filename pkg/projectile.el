;;; pkg/projectile -- summary
;;; Commentary:
;;; Project management based on git repos
;;; Code:

(use-package counsel-projectile :straight t :defer t)

(use-package projectile
  :straight t
  :requires (counsel counsel-projectile)
  :config
  (setq-default projectile-completion-system 'ivy                  ;; Use ivy as completion system
                projectile-enable-caching t                        ;; Cache project files
                projectile-file-exists-local-cache-expire (* 3 60) ;; keep cache for 3 minutes
                projectile-sort-order (quote recently-active)      ;; Order by recently active projects
                projectile-globally-ignored-directories
                (append '("node_modules" ".svn" "_build" "tmp" "log") projectile-globally-ignored-directories)
                ;; Add certain folders to ignored
                ))

(projectile-mode t)

(provide '+custom-pkg-projectile)
;;; projectile.el ends here
