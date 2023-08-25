
					; Activate all the packages
(package-initialize)

; List of packages, which should always be installed
(setq package-list '(cmake-mode  ggtags guide-key
                     highlight-parentheses tao-theme
                     unison-mode visual-regexp yaml-mode flycheck which-key
                     yasnippet git-gutter auto-highlight-symbol
		     realgud nix-mode nixos-options
		     nix-sandbox spacemacs-theme lua-mode
		     doom-modeline doom-themes yasnippet-snippets
		     eglot
		     marginalia
		     ))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

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

(global-company-mode t)    ;; Autocompletion
(global-flycheck-mode t)   ;; Try Bildung projects.
(global-hl-line-mode t)    ;; Highlight the current line
(global-display-line-numbers-mode t)      ;; Show line number everywhere
(column-number-mode t)     ;; Show columns
(global-git-gutter-mode t) ;; Mark lines, which differ from last commit.

(recentf-mode t)           ;; Keep track of recent files
(which-key-mode t)         ;; Automatically show hotkeys
(yas-global-mode t)        ;; Snippets
(doom-modeline-mode t)

(marginalia-mode t)        ;; Show annotations in the minibuffer completions

(global-auto-highlight-symbol-mode t)

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

(use-package vertico
  :custom
  (vertico-count 22)                    ; Number of candidates to display
  (vertico-resize t)
  (vertico-cycle t) ; Go from last to first candidate and first to last (cycle)?
  :config
  (vertico-mode))

(use-package orderless
  :custom
  (completion-category-defaults nil)
  (orderless-matching-styles
  '(orderless-flex orderless-prefixes)
  )  
)
