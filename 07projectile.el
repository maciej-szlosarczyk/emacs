(require 'projectile)

(setq-default projectile-completion-system 'ivy                  ;; Use ivy as completion system
              projectile-enable-caching t                        ;; Cache project files
              projectile-file-exists-local-cache-expire (* 3 60) ;; keep cache for 3 minutes
              projectile-sort-order (quote recently-active)      ;; Order by recently active projects
              projectile-globally-ignored-directories
              (append '("node_modules" ".svn" "_build" "tmp" "log") projectile-globally-ignored-directories)
              ;; Add certain folders to ignored
              )

(projectile-mode t)

(global-set-key (kbd "C-c p s") 'counsel-projectile-switch-project)
(global-set-key (kbd "C-c p t") 'counsel-projectile-find-file)
(global-set-key (kbd "C-c p a") 'counsel-projectile-ag)
(global-set-key (kbd "C-c p c") 'projectile-invalidate-cache)
