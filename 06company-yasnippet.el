;; Company completion framework configuration
(require 'company); Add completion

;; Company configuration
(setq-default company-minimum-prefix-length 2   ; minimum prefix character number for auto complete.
              company-idle-delay 0.3
              company-echo-delay 0
              ;; company-show-numbers t
              company-tooltip-align-annotations t ; align annotations to the right tooltip border.
              company-tooltip-flip-when-above t
              company-tooltip-limit 10          ; tooltip candidates max limit.
              company-tooltip-minimum 2         ; minimum candidates limit.
              company-tooltip-minimum-width 0   ; The minimum width of the tooltip's inner area.
                                        ; This doesn't include the margins and the scroll bar.
              company-tooltip-margin 2          ; width of margin columns to show around the tooltip
              company-tooltip-offset-display 'scrollbar ; 'lines - how to show tooltip unshown candidates number.
              company-show-numbers nil ; t: show quick-access numbers for the first ten candidates.
              company-selection-wrap-around t ; loop over candidates
              ;; company-async-wait 0.03
              ;; company-async-timeout 2
              )

(global-company-mode 1)
(yas-global-mode 1)

(setq-default company-backends '((company-capf company-keywords
                                               company-yasnippet
                                               )
                                 company-elisp ; Emacs Lisp
                                 (company-clang company-cmake) ;; C
                                 company-robe ;; Ruby
                                 alchemist-company ;; Elixir
                                 company-racer ;; Rust
                                 (company-dabbrev-code company-dabbrev company-abbrev) ;; abbrev
                                 company-files ; files & directory
                                 company-ispell ; Ispell
                                 ))
