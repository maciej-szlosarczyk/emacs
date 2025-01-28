;;; pkg/transient -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Global Transient definitions.
;;; Code:
(eval-when-compile (defvar icejam-keys-mode-map))

(use-package transient :ensure (:wait t))

(defun icejam-mark-and-indent-whole-buffer ()
  "Mark and indent whole buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(transient-define-prefix icejam-project-menu ()
  "Project Commands."
  [["Project"
    ("s" "Switch project" project-switch-project)
    ("f" "Find file in project" project-find-file)
    ("g" "Grep in project" consult-ripgrep)
    ("t" "Find file anywhere" find-file)]
   ["Magit"
    ("m" "Git status" magit-status)
    ("C" "Git checkout" magit-checkout)
    ("M" "Git blame" magit-blame)]
   ["Completions"
    ("a" "Find line by contents" consult-line)
    ("b" "Find buffer by name" consult-buffer)]]
  [["LISP"
    ("i" "IELM"                 ielm)
    ("B" "iBuffer"              ibuffer)
    ("e" "eval-region"          eval-region)]
   ["Other"
    ("d" "deft"                 deft)
    ("T" "Speed Type"           speed-type-text)]]
  [[""
    ("q" "Quit" keyboard-quit)]])

(transient-define-prefix icejam-code-menu ()
  "Code Commands."
  [["Manipulate"
    ("c" "Toggle Comment"     comment-line)
    ("r" "Replace"            vr/replace)
    ("i" "Indent"             indent-region)]]
  [["Complete"
    ("g" "Ask GPTel"             gptel-menu)
    ("a" "Aider"                 aider-transient-menu)
    ("e" "Refactor with Elysium" elysium-query)]]
   [["Find"
    ("s" "Swiper"             consult-line)
    ("u" "Vundo"              vundo)
    ("d" "Dash"               dash-at-point)]])

(transient-define-prefix icejam-buffer-menu ()
  "Buffers and windows."
  [""
   ["Move Cursor"
    :pad-keys t
    ("<left>"  "Left buffer" windmove-left)
    ("<right>" "Right buffer" windmove-right)
    ("<up>"    "Top buffer" windmove-up)
    ("<down>"  "Bottom buffer" windmove-down)]
   ["Move this buffer"
    :pad-keys t
    ("v[" "To left" buf-move-left)
    ("v]" "To right"  buf-move-right)
    ("h[" "Up" buf-move-up)
    ("h]" "Down"  buf-move-down)]]
  [["Jump to"
    ("w" "Word" avy-goto-word-1)
    ("l" "Line" avy-goto-line)
    ("c" "Character" avy-goto-char-2)]
   ["Split"
    ("\\" "To right" split-window-right)
    ("/"  "To bottom" split-window-below)]]
  [["Buffers"
    :pad-keys t
    ("s[" "Go to previous buffer" previous-buffer)
    ("s]" "Go to next buffer" next-buffer)
    ("bi" "iBuffer" ibuffer)
    ("bf" "Find buffer" consult-buffer)
    ("k" "Kill buffer and window" kill-buffer-and-window)]]
  [["Fonts"
    :pad-keys t
    ("fs" "Adjust font size globally" global-text-scale-adjust)
    ("fi" "Increase by one in this buffer"
     (lambda () (interactive) (text-scale-increase 1)))
    ("fd" "Decrease by one in this buffer"
     (lambda () (interactive) (text-scale-decrease 1)))
    ("fr" "Reset this buffer"
     (lambda () (interactive) (text-scale-adjust 0)))]]
  [[""
    ("q" "Quit" keyboard-quit)]])

(transient-define-prefix icejam-language-menu ()
  "Language (Buffer) Commands."
  [[:description
    (lambda ()
      (concat (propertize "Code actions for " 'face 'transient-heading)
              (propertize (format "%s" major-mode) 'face 'transient-key)
              (propertize ":\n" 'face 'transient-heading)))

    ("r" "Reload buffer" icejam-revert-buffer-no-confirm)
    ("e" "Show errors" flymake-show-buffer-diagnostics)
    ("f" "Format buffer with apheleia formatter" apheleia-format-buffer)

    ;; This only appears for emacs-lisp-mode
    ("d" "Explain thing at point" helpful-at-point :if-mode emacs-lisp-mode)

    ;; These only appear for LSP mode
    ("m" "LSP iMenu" lsp-ui-imenu
     :if (lambda () (bound-and-true-p lsp-mode)))

    ;; Finally, quit.
    ("q" "Quit" keyboard-quit)]])

(transient-define-prefix icejam-elpaca-menu ()
  "Commands related to packages."
  [["Packages and compilation"
    ("m" "Open Elpaca manager" elpaca-manager)
    ("f" "Fetch all package updates" elpaca-fetch-all)
    ("s" "Symlink treesitter grammar objects" icejam-tree-sitter-symlink-grammar-objects)
    ("p" "Prune native compilation cache" native-compile-prune-cache)
    ("w" "Write elpaca lockfile" icejam-elpaca-write-lock)]]
  [[""
    ("q" "Quit" keyboard-quit)]])

(defcustom icejam-language-transient-alist
  '()
  "List of functions to call for language transient."
  :group 'icejam
  :type '(repeat (cons (symbol :tag "Major mode name")
                       (symbol :tag "Function to call"))))

;; Use different thing for different language
(defun icejam-language-transient-for-mode (&optional maybe-mode)
  "Get transient for major mode.
You can pass MAYBE-MODE to find mode explicitly."
  (let* ((mode (if maybe-mode maybe-mode major-mode)))
    (alist-get mode icejam-language-transient-alist 'icejam-language-menu)))

(defun icejam-transient-for-lang ()
  "Call transient for current major mode."
  (interactive)
  (funcall (icejam-language-transient-for-mode)))

(transient-define-prefix icejam-command-palette ()
  "All transient menus in one place."
  ["Command palette\n"
   ["The thing you are editing"
    ("p" "Project" icejam-project-menu)
    ("c" "Code" icejam-code-menu)
    ("l" "Language" icejam-transient-for-lang)
    ("r" "Revert Buffer" icejam-revert-buffer-no-confirm)]
   ["The editor itself"
    ("b" "iBuffer" ibuffer)
    ("P" "Packages" icejam-elpaca-menu)
    ("w" "Window" icejam-buffer-menu)]])

(keymap-set icejam-keys-mode-map "C-c p" #'icejam-project-menu)
(keymap-set icejam-keys-mode-map "C-c c" #'icejam-code-menu)
(keymap-set icejam-keys-mode-map "C-c w" #'icejam-buffer-menu)
(keymap-set icejam-keys-mode-map "C-c l" #'icejam-transient-for-lang)
(keymap-set icejam-keys-mode-map "H-p" #'icejam-command-palette)

(provide 'icejam-transient)
;;; icejam-transient.el ends here
