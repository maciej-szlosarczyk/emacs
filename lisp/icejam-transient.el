;;; pkg/transient -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Global Transient definitions.
;;; Code:

(require 'icejam-avy)
(require 'icejam-keys-mode)
(use-package transient :ensure (:wait t))

(defun icejam-mark-and-indent-whole-buffer ()
  "Mark and indent whole buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(transient-define-prefix icejam-project-menu ()
  "Project Commands."
  [""
   ["Project"
    ("s" "Switch project"       project-switch-project)
    ("f" "Find file in project" project-find-file)
    ("g" "Grep in project"      consult-ripgrep)]
   ["Completions"
    ("a" "Grep in buffer"       consult-line)
    ("b" "Buffer list"          consult-buffer)
    ("t" "Find file"            find-file)]
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

(transient-define-prefix icejam-code-menu ()
  "Code Commands."
  [""
   ["Manipulate"
    ("c" "Toggle Comment" comment-line)
    ("r" "Replace"        vr/replace)
    ("i" "Indent"         indent-region)
    ("a" "Align"          align-regexp)]
   ["Complete"
    ("y" "Snippet"        company-yasnippet)
    ("m" "Any (Company)"  company-complete)
    ("g" "Ask GPT"        gptel-menu)]
   ["Find"
    ("s" "Swiper"         consult-line)
    ("u" "Vundo"          vundo)
    ("d" "Dash"           dash-at-point)]])

(transient-define-prefix icejam-window-menu ()
  "Windows Commands."
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

(transient-define-prefix icejam-language-menu ()
  "Language (Buffer) Commands."
  [""
   ["Buffer"
    ("r" "Reload"      icejam-revert-buffer-no-confirm)
    ("f" "Format"      lsp-format-buffer)
    ("i" "Indent"      icejam-mark-and-indent-whole-buffer)]
   ["Other"
    ("m" "iMenu"       lsp-ui-imenu)
    ("e" "Show Errors" flycheck-list-errors)]])

(transient-define-prefix icejam-history-menu ()
  "Buffer History Commands."
  ["History"
   ("[" "Previous" previous-buffer)
   ("]" "Next" previous-buffer)])

(transient-define-prefix icejam-move-menu ()
  "Move Commands."
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

(transient-define-prefix icejam-font-menu ()
  "Font Commands."
  [""
   ["Everywhere"
    ("R" "Reset to default" set-font-to-screen)
    ("s" "Set size" set-font-size)]
   ["In this buffer"
    ("i" "Bigger"           (lambda () (interactive) (text-scale-increase 1)))
    ("d" "Smaller"          (lambda () (interactive) (text-scale-decrease 1)))
    ("r" "Reset"            (lambda () (interactive) (text-scale-adjust 0)))]])

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

(define-key icejam-keys-mode-map (kbd "C-c p") 'icejam-project-menu)
(define-key icejam-keys-mode-map (kbd "C-c c") 'icejam-code-menu)
(define-key icejam-keys-mode-map (kbd "C-c w") 'icejam-window-menu)
(define-key icejam-keys-mode-map (kbd "C-c s") 'icejam-history-menu)
(define-key icejam-keys-mode-map (kbd "C-c f") 'icejam-font-menu)
(define-key icejam-keys-mode-map (kbd "C-c m") 'icejam-move-menu)
(define-key icejam-keys-mode-map (kbd "C-c l") 'icejam-transient-for-lang)

(provide 'icejam-transient)
;;; icejam-transient.el ends here
