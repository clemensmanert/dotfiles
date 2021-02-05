	; List of packages, which should always be installed
(setq package-list '(cmake-mode  ggtags guide-key helm-purpose company-c-headers
                     helm-themes highlight-parentheses spaceline tao-theme
                     unison-mode visual-regexp yaml-mode flycheck which-key
                     yasnippet git-gutter auto-highlight-symbol smart-mode-line
		     realgud nix-mode nixos-options company-nixos-options
		     nix-sandbox spacemacs-theme lua-mode irony company-irony
		     ansi-color smart-mode-line spacemacs-theme
		     ))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
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

;; Hide distracting gui components
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(global-highlight-parentheses-mode t) ;; Highlight encloseing parentheses
(global-company-mode t)    ;; Autocompletion
(global-flycheck-mode t)   ;; Try Bildung projects.
(global-hl-line-mode t)    ;; Highlight the current line
(global-display-line-numbers-mode t)      ;; Show line number everywhere
(column-number-mode t)     ;; Show columns
(global-whitespace-mode t) ;; Highlight tabs, (trailing) spaces and long lines
(global-git-gutter-mode t) ;; Mark lines, which differ from last commit.

(helm-mode t)              ;; Better ui
(recentf-mode t)           ;; Keep track of recent files
(which-key-mode t)         ;; Automatically show hotkeys
(yas-global-mode t)        ;; Snippets
(require 'spaceline-config)
(spaceline-spacemacs-theme)
(spaceline-helm-mode t)


(global-auto-highlight-symbol-mode t)

(semantic-mode t)
;; Shows a summary at the bottom i.e. protype
(global-semantic-idle-summary-mode t)

;; Shows the context in the headline
(global-semantic-stickyfunc-mode t)
(global-semantic-idle-local-symbol-highlight-mode t)

(add-to-list 'auto-mode-alist '("\.tsx\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\.ts\'" . typescript-mode))

(dolist (hook '(text-mode-hook))
      (add-hook hook (lambda () (flyspell-mode t))))

(dolist (hook '(org-mode-hook))
      (add-hook hook (lambda () (flyspell-mode t))))

(dolist (hook '(org-mode-hook))
      (add-hook hook (lambda () (flyspell-mode t))))

(dolist (hook '(LaTeX-mode-hook))
      (add-hook hook (lambda () (flyspell-mode t))))

