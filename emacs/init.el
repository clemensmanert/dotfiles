
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load-file "~/.emacs.d/used-modes.el")

(load-file "~/.emacs.d/bindings.el")

(load-file "~/.emacs.d/settings.el")

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(fci-rule-color "#F0F0F0")
 '(package-selected-packages
   (quote
    (yafolding fold-dwim folding git-command git-messenger git-timemachine disaster modern-cpp-font-lock mc-extras mc-jump git-gutter git-blamed ibuffer-git company-irony company-irony-c-headers flycheck-irony irony yara-mode yaml-mode xcscope wsd-mode which-key web-mode wanderlust visual-regexp typescript tss tern-auto-complete tao-theme tango-2 stickyfunc-enhance spacemacs-theme spaceline soundcloud rtags rainbow-delimiters naquadah-theme moe-theme minimap lua-mode linum-relative js2-refactor highlight-tail highlight-parentheses highlight-current-line highlight-80+ helm-themes helm-mode-manager helm-ls-git helm-ispell helm-helm-commands helm-gtags helm-git-files helm-git helm-flyspell helm-flycheck helm-dictionary helm-company hardcore-mode guide-key ghc ggtags free-keys fold-this flymake-yaml flycheck-tip flycheck-google-cpplint flycheck-ghcmod flycheck-clangcheck fill-column-indicator evil-surround evil-org evil-annoying-arrows ess-smart-underscore ess-smart-equals ess-R-object-popup ess-R-data-view ensime ecb dummyparens diffview csharp-mode cpputils-cmake company-web company-tern company-c-headers company-auctex color-theme cmake-mode calfw badwolf-theme auto-highlight-symbol auto-complete-clang auto-complete-c-headers ample-zen-theme ample-theme afternoon-theme ac-haskell-process ac-clang)))
 '(vc-annotate-background "#D9D9D9")
 '(vc-annotate-color-map
   (quote
    ((20 . "#616161")
     (40 . "#3C3C3C")
     (60 . "#3C3C3C")
     (80 . "#252525")
     (100 . "#252525")
     (120 . "#161616")
     (140 . "#161616")
     (160 . "#0E0E0E")
     (180 . "#0E0E0E")
     (200 . "#0E0E0E")
     (220 . "#080808")
     (240 . "#080808")
     (260 . "#080808")
     (280 . "#080808")
     (300 . "#080808")
     (320 . "#080808")
     (340 . "#080808")
     (360 . "#080808"))))
 '(vc-annotate-very-old-color "#161616"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
