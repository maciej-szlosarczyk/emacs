(require 'hydra)

(defhydra hydra-file-switcher-menu (:color teal :hint nil)
  "
^Ivy^                           ^Projectile^                  ^Magit^
^^^^^^^^------------------------------------------------------------------------
_a_: ag                         _s_: Switch project           _m_: status
_b_: Switch buffer              _f_: Find file in project
_t_: Find file                  _g_: ag in current project
^^                              _c_: invalidate cache
"
  ("q" nil "cancel" :color pink)

  ("a" counsel-ag)
  ("b" ivy-switch-buffer)
  ("t" counsel-find-file)
  ("s" counsel-projectile-switch-project)
  ("f" counsel-projectile-find-file)
  ("g" counsel-projectile-ag)
  ("c" projectile-invalidate-cache)
  ("m" magit-status))

(global-set-key (kbd "C-c p") 'hydra-file-switcher-menu/body)

(defhydra hydra-programming-actions (:color teal :hint nil :columns 4)
  "
  Programming actions

^Windows^                      ^Code Manipulation^
^^^^^^^^-----------------------------------------------------------------------
_k_:   kill buffer and window  _c_: comment line
_sh_: split horizontally      _r_: regex replace
_sv_: split vertically        _i_: indent region
^^                             _a_: align regexp
"
  ("q" nil "cancel" :color pink)

  ("k"   kill-buffer-and-window)
  ("sh" split-window-below)
  ("sv" split-window-right)
  ("c"   comment-line)
  ("r"   vr/replace)
  ("i"   indent-region)
  ("a"   align-regexp))

(define-key prog-mode-map (kbd "C-c c") 'hydra-programming-actions/body)
