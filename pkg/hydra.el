;;; pkg/hydra -- summary
;;; Commentary:
;;; Global hydra definitions.
;;; Code:
(use-package hydra
  :ensure t
  :defer t
  :config
  (defhydra hydra-file-switcher-menu (:color teal :hint nil)
    "
  General Actions

   ^Ivy^                           ^Projectile^                  ^Magit^
^^^^^^^^------------------------------------------------------------------------
_a_: Grep in buffer             _s_: Switch project           _m_: Git status
_b_: Buffer list                _f_: Find file in project     _C_: Git checkout
_t_: Find file                  _g_: Grep in current project  _M_: Git blame
_d_: Deft                       _c_: Invalidate cache
^^                              _n_: New project
^^                              _i_: IELM console
"
    ("q" nil "cancel" :color blue)

    ("a" counsel-rg)
    ("b" ibuffer)
    ("t" counsel-find-file)
    ("d" deft)
    ("s" counsel-projectile-switch-project)
    ("f" counsel-projectile-find-file)
    ("g" counsel-projectile-rg)
    ("c" projectile-invalidate-cache)
    ("n" projectile-add-known-project)
    ("i" ielm)
    ("m" magit-status)
    ("C" magit-checkout)
    ("M" magit-blame))

  (defhydra hydra-programming-menu (:color teal :hint nil)
    "
  Programming actions

   ^Code Manipulation^    ^Code Completion^
^^^^^^^^-----------------------------------------------------------------------
_c_: Comment line      _y_: Yasnippet
_r_: Regex replace     _m_: Company
_i_: Indent region
_a_: Align regexp
_e_: Eval region
_s_: Swiper
"
    ("q" nil "cancel" :color blue)

    ("c"  comment-line)
    ("r"  vr/replace)
    ("i"  indent-region)
    ("a"  align-regexp)
    ("e"  eval-region)
    ("s"  swiper)

    ("y"  company-yasnippet)
    ("m"  company-complete))

  (defhydra hydra-window-menu (:color teal :hint nil)
    "
  Window actions

   ^Windows^                          ^Move around^
^^^^^^^^-----------------------------------------------------------------------
_k_: Kill buffer and window   _<left>_: Move left
_h_: Split horizontally      _<right>_: Move right
_v_: Split vertically           _<up>_: Move up
^^                            _<down>_: Move down
^^                                 _p_: Previous buffer
^^                                 _n_: Next buffer
"
    ("q" nil "cancel" :color blue)

    ("k"       kill-buffer-and-window)
    ("h"       split-window-below)
    ("v"       split-window-right)

    ("<left>"  windmove-left)
    ("<right>" windmove-right)
    ("<up>"    windmove-up)
    ("<down>"  windmove-down)
    ("p"       previous-buffer)
    ("n"       next-buffer))

  (defhydra hydra-language-context-menu (:color teal :hint nil)
    "
  Context actions

   ^Context^                          ^Actions^
^^^^^^^^-----------------------------------------------------------------------
_r_: Reload buffer                 _f_: Format buffer
_i_: Indent buffer                 _m_: iMenu
"
    ("q" nil "cancel" :color blue)

    ("r" revert-buffer-no-confirm)
    ("i" indent-region)

    ("f" lsp-format-buffer)
    ("m" lsp-ui-imenu))

  :bind ("C-c p" . hydra-file-switcher-menu/body)
        ("C-c c" . hydra-programming-menu/body)
        ("C-c w" . hydra-window-menu/body)
        ("C-c l" . hydra-language-context-menu/body))

(provide 'pkg/hydra)
;;; hydra.el ends here
