; Author: Clemens@Manert.de

;; Set emacs background colour during loading when in x mode
(when (display-graphic-p)
  (set-background-color "#262B2C")
)

(load-file "~/.emacs.d/used-modes.el")

(load-file "~/.emacs.d/color-themes.el")

(load-file "~/.emacs.d/bindings.el")

(load-file "~/.emacs.d/utils.el")

(load-file "~/.emacs.d/settings.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "9558f71c706fba7b136e75d9c5e73ddd2c9d91e76e2b18f733d4ab2f388f3b72" "1c6c7d5e4beaec0a54d814454106d180de7b90f8961d3edd2f6567f7c08da97e" "f0ea6118d1414b24c2e4babdc8e252707727e7b4ff2e791129f240a2b3093e32" "698f6c799733e1f051f41ba2f2e0a9487178834ceb495b3c21e06fb999699779" "968d1ad07c38d02d2e5debffc5638332696ac41af7974ade6f95841359ed73e3" "21d9280256d9d3cf79cbcf62c3e7f3f243209e6251b215aede5026e0c5ad853f" "e8ff60c7811d4532ee9f756b654d2f13d455e04851ee60c5e033e1b6a17e968f" default)))
 '(safe-local-variable-values (quote ((LocalWords . org) (LocalWords . RSA) (eval setq ispell-dictionary "de-neu") (eval linum-mode t) (eval auto-complete-mode t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
