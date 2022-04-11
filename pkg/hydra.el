;;; pkg/hydra -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Global hydra definitions.
;;; Code:

(require '+custom-pkg-avy "$HOME/.emacs.d/pkg/avy.el")

(defun mark-and-indent-whole-buffer ()
  "Mark and indent whole buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(use-package hydra
  :straight t
  :defer t
  :config
  (defhydra +hydra-project-menu (:color teal :hint nil)
    "
^
^ Projectile              ^^Ivy                  ^^Magit
^────────────────────────────────────────────────────────────────────────────────
^ _s_: Switch project       _a_: Grep in buffer    _m_: Git status
^ _f_: Find file in project _b_: Buffer list       _C_: Git checkout
^ _g_: Grep in project      _t_: Find file         _M_: Git blame
^ _c_: Invalidate cache
^ _n_: New project

^ LISP                    ^^Other
^────────────────────────────────────────────────────────────────────────────────
^ _i_: Console              _d_: Deft
^ _e_: Eval region          _T_: Speed type
^
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
    ("T" speed-type-text)
    ("e" eval-region)

    ("m" magit-status)
    ("C" magit-checkout)
    ("M" magit-blame))

  (defhydra +hydra-code-menu (:color teal :hint nil)
    "
^
^ Manipulate          ^^Complete          ^^Find
^────────────────────────────────────────────────────────────────────────────────
^ _c_: Toggle comment   _y_: Snippet        _s_: Swiper
^ _r_: Replace          _m_: Any (Company)  _u_: Undo tree
^ _i_: Indent^^                             _d_: Dash
^ _a_: Align
^
"
    ("q" nil "cancel" :color blue)

    ("c"  comment-line)
    ("r"  vr/replace)
    ("i"  indent-region)
    ("a"  align-regexp)
    ("s"  swiper)
    ("d"  dash-at-point)

    ("u"  undo-tree-visualize)
    ("y"  company-yasnippet)
    ("m"  company-complete))

  (defhydra +hydra-window-menu (:color teal :hint nil)
    "
^ Move           Split                                        Kill
^────────────────────────────────────────────────────────────────────────────────
^ _<left>_:  Left  _h_: Horizontally
^ _<right>_: Right _v_: Vertically
^ _<up>_:    Up
^ _<down>_:  Down                                               _k_: Kill Buffer
^
"
    ("q" nil "cancel" :color blue)

    ("k"       kill-buffer-and-window)
    ("h"       split-window-below)
    ("v"       split-window-right)

    ("<left>"  windmove-left)
    ("<right>" windmove-right)
    ("<up>"    windmove-up)
    ("<down>"  windmove-down))

  (defhydra +hydra-language-context-menu (:color teal :hint nil)
    "
^
^ Buffer     Other
^────────────────────────────────────────────────────────────────────────────────
^ _r_: Reload  _m_: iMenu
^ _f_: Format  _e_: Show Errors
^ _i_: Indent
^
"
    ("q" nil "cancel" :color blue)

    ("r" revert-buffer-no-confirm)
    ("i" mark-and-indent-whole-buffer)

    ("f" lsp-format-buffer)
    ("m" lsp-ui-imenu)
    ("e" flycheck-list-errors))

  (defhydra +hydra-history-menu (:color teal :hint nil)
    "
^
^ History
^────────────────────────────────────────────────────────────────────────────────
^ _[_: Previous
^ _]_: Next
^
"
    ("[" previous-buffer)
    ("]" next-buffer)

    ("q" nil "cancel" :color blue))

  (defhydra +hydra-move-menu (:color teal :hint nil)
    "
^
^ Move this buffer    ^^Jump to
^────────────────────────────────────────────────────────────────────────────────
^ _{_: Up               _w_: Word
^ _[_: Left             _c_: Character
^ _]_: Right            _l_: Line
^ _{_: Down
^
"
    ("[" buf-move-left)
    ("]" buf-move-right)
    ("{" buf-move-up)
    ("}" buf-move-down)
    ("w" avy-goto-word-1)
    ("l" avy-goto-line)
    ("c" avy-goto-char-2)
    ("q" nil "quit"))

  (defhydra +hydra-font-menu (:color teal :hint nil)
    "
^
^ Everywhere            ^^In this buffer
^────────────────────────────────────────────────────────────────────────────────
^ _s_: Set size           _i_: Bigger
^ _R_: Reset to default   _d_: Smaller
^^^                       _r_: Reset
^
"
    ("i" (text-scale-increase 1))
    ("d" (text-scale-decrease 1))
    ("r" (text-scale-adjust 0))
    ("R" set-font-to-screen)
    ("s" set-font-size)
    ("q" nil "cancel" :color blue))

  (defhydra +hydra-of-hydras (:color teal :hint nil)
    "
^
^ Hydras
^────────────────────────────────────────────────────────────────────────────────
^ _p_: Projects^^^  _h_: History
^ _c_: Code^^^      _m_: Move
^ _l_: Language^^^  _f_: Fonts
^
"
    ("p" +hydra-project-menu/body)
    ("c" +hydra-code-menu/body)
    ("w" +hydra-window-menu/body)
    ("h" +hydra-history-menu/body)
    ("f" +hydra-font-menu/body)
    ("m" +hydra-move-menu/body)
    ("l" +hydra-language-context-menu/body)
    ("q" nil "cancel"))

  :bind ("C-c p" . +hydra-project-menu/body)
        ("C-c C-p" . +hydra-project-menu/body)
        ("C-c h" . +hydra-of-hydras/body)
        ("C-c C-h" . +hydra-of-hydras/body)
        ("C-c c" . +hydra-code-menu/body)
        ("C-c w" . +hydra-window-menu/body)
        ("C-c s" . +hydra-history-menu/body)
        ("C-c f" . +hydra-font-menu/body)
        ("C-c m" . +hydra-move-menu/body)
        ("C-c l" . +hydra-language-context-menu/body)
        ("C-c C-l" . +hydra-language-context-menu/body))

(provide '+custom-pkg-hydra)
;;; hydra.el ends here
