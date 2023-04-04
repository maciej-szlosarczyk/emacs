;;; pkg/transient -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Global Transient definitions.
;;; Code:

(require '+custom-pkg-avy "$HOME/.emacs.d/pkg/avy.el")

(use-package transient :straight t)

(defun mark-and-indent-whole-buffer ()
  "Mark and indent whole buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(transient-define-prefix +custom-pkg-transient/project-menu ()
  "Project Commands"
  [""
   ["Projectile"
    ("s" "Switch project"       counsel-projectile-switch-project)
    ("f" "Find file in project" counsel-projectile-find-file)
    ("g" "Grep in project"      counsel-projectile-rg)
    ("c" "invalidate cache"     projectile-invalidate-cache)
    ("n" "New project"          projectile-add-known-project)]
   ["Ivy"
    ("a" "Grep in buffer"       counsel-rg)
    ("b" "Buffer list"          ibuffer)
    ("t" "Find file"            counsel-find-file)]
   ["Magit"
    ("m" "Git status"           magit-status)
    ("C" "Git checkout"         magit-checkout)
    ("M" "Git blame"            magit-blame)]]
  [""
   ["LISP"
    ("i" "IELM"                 ielm)
    ("e" "eval-region"          eval-region)]
   ["Other"
    ("d" "deft"                 deft)
    ("T" "Speed Type"           speed-type-text)]])

(transient-define-prefix +custom-pkg-transient/code-menu ()
  "Code Commands"
  [""
   ["Manipulate"
    ("c" "Toggle Comment" comment-line)
    ("r" "Replace"        vr/replace)
    ("i" "Indent"         indent-region)
    ("a" "Align"          align-regexp)]
   ["Complete"
    ("y" "Snippet"        company-yasnippet)
    ("m" "Any (Company)"  company-complete)]
   ["Find"
    ("s" "Swiper"         swiper)
    ("u" "Undo tree"      undo-tree-visualize)
    ("d" "Dash"           dash-at-point)]])

(transient-define-prefix +custom-pkg-transient/window-menu ()
  "Windows Commands"
  [""
   ["Move"
    ("<left>" " Left"   windmove-left)
    ("<right>" "Right"  windmove-right)
    ("<up>" "   Up"     windmove-up)
    ("<down>" " Down"   windmove-down)]
   ["Split"
    ("h" "Horizontally" split-window-below)
    ("v" "Vertically"   split-window-right)]
   ["Kill"
    ""
    ""
    ""
    ("k" "Kill Buffer"  kill-buffer-and-window)]])

(transient-define-prefix +custom-pkg-transient/language-context-menu ()
  "Language (Buffer) Commands"
  [""
   ["Buffer"
    ("r" "Reload"      revert-buffer-no-confirm)
    ("f" "Format"      lsp-format-buffer)
    ("i" "Indent"      mark-and-indent-whole-buffer)]
   ["Other"
    ("m" "iMenu"       lsp-ui-imenu)
    ("e" "Show Errors" flycheck-list-errors)]])

(transient-define-prefix +custom-pkg-transient/history-menu ()
  "Buffer History Commands"
  ["History"
   ("[" "Previous" previous-buffer)
   ("]" "Next" previous-buffer)])

(transient-define-prefix +custom-pkg-transient/move-menu ()
  "Move Commands"
  [""
   ["Move this buffer"
    ("{" "Up"    buf-move-left)
    ("[" "Left"  buf-move-right)
    ("}" "Right" buf-move-up)
    ("]" "Down"  buf-move-down)]
   ["Jump to"
    ("w" "Word" avy-goto-word-1)
    ("l" "Character" avy-goto-line)
    ("c" "Line" avy-goto-char-2)]])

(transient-define-prefix +custom-pkg-transient/font-menu ()
  "Font Commands"
  [""
   ["Everywhere"
    ("R" "Reset to default" set-font-to-screen)
    ("s" "Set size" set-font-size)]
   ["In this buffer"
    ("i" "Bigger"           (lambda () (interactive) (text-scale-increase 1)))
    ("d" "Smaller"          (lambda () (interactive) (text-scale-decrease 1)))
    ("r" "Reset"            (lambda () (interactive) (text-scale-adjust 0)))]])

(define-key global-map (kbd "C-c p") '+custom-pkg-transient/project-menu)
(define-key global-map (kbd "C-c c") '+custom-pkg-transient/code-menu)
(define-key global-map (kbd "C-c w") '+custom-pkg-transient/window-menu)
(define-key global-map (kbd "C-c s") '+custom-pkg-transient/history-menu)
(define-key global-map (kbd "C-c f") '+custom-pkg-transient/font-menu)
(define-key global-map (kbd "C-c m") '+custom-pkg-transient/move-menu)
(define-key global-map (kbd "C-c l") '+custom-pkg-transient/language-context-menu)

(provide '+custom-pkg-transient)
;;; transient.el ends here
