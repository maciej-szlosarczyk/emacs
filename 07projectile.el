(require 'projectile)


(setq-default projectile-enable-caching t                        ;; Cache project files
              projectile-file-exists-local-cache-expire (* 3 60) ;; keep cache for 3 minutes
              projectile-sort-order (quote recently-active)      ;; Order by recently active projects
              projectile-globally-ignored-directories
              (append '("node_modules" ".svn" "_build" "tmp" "log") projectile-globally-ignored-directories)
              ;; Add certain folders to ignored
                            )

(projectile-mode t)

(evil-leader/set-key "ps" 'counsel-projectile-switch-project)
(evil-leader/set-key "pt"  'counsel-projectile-find-file)
(evil-leader/set-key "pa" 'counsel-projectile-ag)
(evil-leader/set-key "pc" 'projectile-invalidate-cache)
