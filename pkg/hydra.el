;;; pkg/hydra -- summary
;;; Commentary:
;;; Global hydra definitions.
;;; Code:

(require 'icejam-pkg-avy "$HOME/.emacs.d/pkg/avy.el")

(defun mark-and-indent-whole-buffer ()
  "Mark and indent whole buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(use-package hydra
  :straight t
  :defer t
  :config
  (defhydra +hydra-file-switcher-menu (:color teal :hint nil)
    "
^                                   General actions
^^^^^^^^--------------------------------------------------------------------------------------------
^Ivy:               _a_: Grep in buffer     _B_: Buffer list            _t_: Find file
^Avy:               _w_: Goto word          _l_: Goto line              _:_: Goto char
^
^Perspective:       _p_: Switch perspective _b_: Buffers in perspective _K_: Kill perspective
^Projectile:        _s_: Switch project     _f_: Find file in project   _g_: Grep in project
^                   _c_: Invalidate cache   _n_: New project
^Magit:             _m_: Git status         _C_: Git checkout           _M_: Git blame
^
^LISP:              _i_: Console            _e_: Eval region
^                   _d_: Deft
^
"

    ("q" nil "cancel" :color blue)

    ("a" counsel-rg)
    ("B" ibuffer)
    ("t" counsel-find-file)
    ("d" deft)
    ("w" avy-goto-word-0)
    ("l" avy-goto-line)
    (":" avy-goto-char)

    ("p" persp-switch)
    ("b" persp-ibuffer)
    ("K" persp-kill)

    ("s" counsel-projectile-switch-project)
    ("f" counsel-projectile-find-file)
    ("g" counsel-projectile-rg)
    ("c" projectile-invalidate-cache)
    ("n" projectile-add-known-project)
    ("i" ielm)
    ("e" eval-region)

    ("m" magit-status)
    ("C" magit-checkout)
    ("M" magit-blame))

  (defhydra +hydra-programming-menu (:color teal :hint nil)
    "
^                                   Code actions
^^^^^^^^--------------------------------------------------------------------------------------------
Manipulate: _c_: Toggle comment _r_: Replace       _i_: Indent _a_: Align
Complete:   _y_: Snippet        _m_: Any (Company)
Find:       _s_: Swiper         _u_: Undo tree
^
"
    ("q" nil "cancel" :color blue)

    ("c"  comment-line)
    ("r"  vr/replace)
    ("i"  indent-region)
    ("a"  align-regexp)
    ("s"  swiper)

    ("u"  undo-tree-visualize)
    ("y"  company-yasnippet)
    ("m"  company-complete))

  (defhydra +hydra-window-menu (:color teal :hint nil)
    "
^                                   Buffer actions
^^^^^^^^--------------------------------------------------------------------------------------------
Move:  _<left>_: Left         _<right>_: Right      _<up>_: Up       _<down>_: Down
Split:      _h_: Horizontally       _v_: Vertically
            _k_: Kill Buffer
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
^                                   Language-specific actions
^^^^^^^^--------------------------------------------------------------------------------------------
Buffer: _r_: Reload _f_: Format _i_: Indent
Other:  _m_: iMenu
^^
"
    ("q" nil "cancel" :color blue)

    ("r" revert-buffer-no-confirm)
    ("i" mark-and-indent-whole-buffer)

    ("f" lsp-format-buffer)
    ("m" lsp-ui-imenu))

  (defhydra +hydra-move-menu (:color teal)
    "Buffer history"
    ("["       previous-buffer "Previous buffer")
    ("]"       next-buffer "Next buffer")
    ("q" cancel "quit"))

  (defhydra +hydra-bufmove (:color teal :hint nil)
    "
^                                   Move current buffer
^^^^^^^^--------------------------------------------------------------------------------------------
^          _{_: Up
^_[_: Left           _]_: Right
^          _{_: Down
^^
"
    ("[" buf-move-left)
    ("]" buf-move-right)
    ("{" buf-move-up)
    ("}" buf-move-down)
    ("q" cancel "quit"))

  (defhydra +hydra-font-menu (:color teal)
    "Buffer history"
    ("i"       (text-scale-increase 1) "Bigger font in this buffer")
    ("d"       (text-scale-decrease 1) "Smaller font in this buffer")
    ("r"       (text-scale-adjust 0) "Reset font in this buffer")
    ("R"       set-font-to-screen "Reload font to screen")
    ("q" cancel "quit"))

  :bind ("C-c p" . +hydra-file-switcher-menu/body)
        ("C-c c" . +hydra-programming-menu/body)
        ("C-c w" . +hydra-window-menu/body)
        ("C-c s" . +hydra-move-menu/body)
        ("C-c f" . +hydra-font-menu/body)
        ("C-c m" . +hydra-bufmove/body)
        ("C-c l" . +hydra-language-context-menu/body))

(provide 'icejam-pkg-hydra)
;;; hydra.el ends here
