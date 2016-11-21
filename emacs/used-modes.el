; List of packages, which should always be installed
(setq package-list '(cmake-mode company-c-headers ggtags guide-key helm-purpose
                     helm-themes highlight-parentheses spaceline tao-theme
                     unison-mode visual-regexp yaml-mode flycheck which-key yasnippet
                    ))

; Repositories
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))


; Activate all the packages
(package-initialize)

; Fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; Install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
     (package-install package)))

(require 'spaceline-config)
(spaceline-spacemacs-theme)

;; hide distracting gui components
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(global-company-mode t)
(global-flycheck-mode t)
(global-highlight-parentheses-mode t)
(global-hl-line-mode t)
(global-linum-mode t)
(global-whitespace-mode t)

(helm-mode t)              ;; Better ui
(recentf-mode t)           ;; Keep track of recent files
(which-key-mode t)         ;; Automatically show hotkeys
(yas-global-mode t)        ;; Snippets

(semantic-mode t)
;; Shows a summary at the bottom i.e. protype
(global-semantic-idle-summary-mode t)

;; Shows the context in the headline
(global-semantic-stickyfunc-mode t)
(global-semantic-idle-local-symbol-highlight-mode t)

