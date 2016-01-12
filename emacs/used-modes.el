;; This file contains all the used modes, how they get loaded and its
;; configurations.
;; Author: Clemens Manert (Clemens@Manert.de)

;; All the packages, I want to have installed.
(setq package-list '(rainbow-delimiters
		     helm
		     minimap
		     visual-regexp		     
		     highlight-tail
		     powerline
		     afternoon-theme
		     naquadah-theme
		     tango-2
		     moe-theme
		     linum-relative
		     auto-complete
		     guide-key))

;; Package Repositories
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))

;; Activate all the packages (in particular autoloads)
(package-initialize)
;;(package-refresh-contents) 

;; Install the missing packages
;;(dolist (package package-list)
;; (unless (package-installed-p package)
;;        (package-install package)))

;; Show matching parantheses and stuff in fancy colors.
(rainbow-delimiters-mode t)

;; Helps finding emacs commands while using M-x.
(helm-mode t)

;; snippets
(yas-global-mode t)

;; A line at the end of each frame, which holds some use full
;; information about the current shown buffer.
(require 'powerline)

;; A fancy minimap at the side of the frame, which can be used to
;; navigate through the text. Show it at the right side of a frame.
(setq minimap-window-location 'right)

;; Leaves a fancy tail behind the cursor -- pretty impressive
(require 'highlight-tail)
(highlight-tail-mode t)

;; Show the line number relative 
(require 'linum-relative)

;; Searches for equal stirngs while typing in the whole buffer.
(auto-complete-mode t)

;; Auto Complete for emacs commands
(ido-mode t)

;; Auto complete for emacs hotkeys
(setq guide-key/guide-key-sequence 't)
(guide-key-mode t)  

;; Show the recent openet files in emacs
(require 'recentf)
(recentf-mode t)

;; Use mini-buffer history over the sessions.
(savehist-mode)

;; Minor Modes for JS
(add-hook 'js3-mode-hook
	  (lambda ()
	    (tern-mode t)
	    (tern-ac-setup)
	    (auto-fill-mode t)
	    ))

(linum-mode t)
(auto-complete-mode t)
(auto-highlight-symbol-mode t)	    

;; Minor Modes for Programming
(add-hook 'c-mode-hook 
	  (lambda () 
	    (auto-highlight-symbol-mode t)	    
	    )
	  )
