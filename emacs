::q
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(background-color "#202020")
 '(background-mode dark)
 '(cursor-color "#cccccc")
 '(custom-safe-themes
   (quote
    ("9d91458c4ad7c74cf946bd97ad085c0f6a40c370ac0a1cbeb2e3879f15b40553" "c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" "c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" "707227acad0cf8d4db55dcf1e574b3644b68eab8aca4a8ce6635c8830bc72144" "2a998a3b66a0a6068bcb8b53cd3b519d230dd1527b07232e54c8b9d84061d48d" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "4980e5ddaae985e4bae004280bd343721271ebb28f22b3e3b2427443e748cd3f" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "1747d30c98ba414fc837d042d2557f65d0697fcc9236c5c3d2ccd57a93b92a9e" "1b27e3b3fce73b72725f3f7f040fd03081b576b1ce8bbdfcb0212920aec190ad" "38dba83122d982aae1e9bed53cc268e2be9820bccc9087ef4418cad7bb9ef61b" "3eb93cd9a0da0f3e86b5d932ac0e3b5f0f50de7a0b805d4eb1f67782e9eb67a4" "d6db7498e2615025c419364764d5e9b09438dfe25b044b44e1f336501acd4f5b" "d21135150e22e58f8c656ec04530872831baebf5a1c3688030d119c114233c24" "946e871c780b159c4bb9f580537e5d2f7dba1411143194447604ecbaf01bd90c" "08b8807d23c290c840bbb14614a83878529359eaba1805618b3be7d61b0b0a32" default)))
 '(foreground-color "#cccccc")
 '(package-selected-packages
   (quote
    (zenburn-theme monokai-theme smart-mode-line-powerline-theme smart-mode-line mode-icons airline-themes atom-one-dark-theme neotree ant rainbow-delimiters rust-mode scala-mode haskell-mode yasnippet yaml-mode ujelly-theme rvm ruby-end rinari noctilux-theme markdown-mode jira indent-guide helm-projectile helm-ag haml-mode flycheck flatui-theme exec-path-from-shell evil-terminal-cursor-changer evil-nerd-commenter evil-magit evil-leader dumb-jump dockerfile-mode diff-hl base16-theme avk-emacs-themes alchemist aggressive-indent ag))))
 '(custom-safe-themes
   (quote
    ("15348febfa2266c4def59a08ef2846f6032c0797f001d7b9148f30ace0d08bcf" "62c80c6889010c3f0656e81ae201754058fd44743076f8dc56c595c2b9b5e298" "49b36c626548d200f97144cedb44f0a48020fda221b9e2930dc7d95ef4013eb1" "c3e6b52caa77cb09c049d3c973798bc64b5c43cc437d449eacf35b3e776bf85c" "38dba83122d982aae1e9bed53cc268e2be9820bccc9087ef4418cad7bb9ef61b" "39fe48be738ea23b0295cdf17c99054bb439a7d830248d7e6493c2110bfed6f8" "85d609b07346d3220e7da1e0b87f66d11b2eeddad945cac775e80d2c1adb0066" "be4025b1954e4ac2a6d584ccfa7141334ddd78423399447b96b6fa582f206194" "cc60d17db31a53adf93ec6fad5a9cfff6e177664994a52346f81f62840fe8e23" "ba9be9caf9aa91eb34cf11ad9e8c61e54db68d2d474f99a52ba7e87097fa27f5" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "d96587ec2c7bf278269b8ec2b800c7d9af9e22d816827639b332b0e613314dfd" "5a7830712d709a4fc128a7998b7fa963f37e960fd2e8aa75c76f692b36e6cf3c" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "eae831de756bb480240479794e85f1da0789c6f2f7746e5cc999370bbc8d9c8a" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "ef04dd1e33f7cbd5aa3187981b18652b8d5ac9e680997b45dc5d00443e6a46e3" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" default)))
 '(package-selected-packages
   (quote
    (flatui-theme jira dockerfile-mode imenu-anywhere dumb-jump apropospriate-theme avk-emacs-themes punpun-theme git-gutter haml-mode multiple-cursors ujelly-theme cherry-blossom-theme firebelly-theme noctilux-theme yasnippet flycheck evil-magit magit rinari aggressive-indent agressive-indent exec-path-from-shell helm-ag flycheck-elixir-credo elixir-yasnippets markdown-mode helm-projectile ag evil-leader ruby-end helm projectile indent-guide solarized-theme base16-theme neotree alchemist rvm diff-hl ##)))
 '(safe-local-variable-values (quote ((encoding . utf-8))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; Set performance
(setq gc-cons-threshold 100000000)

; load custom config files
(load "~/.emacs.d/packages.el")
(load "~/.emacs.d/behaviour.el")
(load "~/.emacs.d/key-bindings.el")
;;; emacs ends here
