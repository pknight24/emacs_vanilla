(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

;; set up use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install `use-package))

(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" "dbade2e946597b9cda3e61978b5fcc14fa3afa2d3c4391d477bdaeff8f5638c5" "a5d04a184d259f875e3aedbb6dbbe8cba82885d66cd3cf9482a5969f44f606c0" "801a567c87755fe65d0484cb2bded31a4c5bb24fd1fe0ed11e6c02254017acb2" default)))
 '(package-selected-packages
   (quote
    (elpy poly-R poly-markdown polymode ess nord magit melancholy-theme projectile nord-theme which-key use-package auctex zenburn-theme zen-mode julia-repl julia-mode helm tao-theme evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; this needs to be required for some reason (to get 'string-trim)
(require 'subr-x)

;; load and enable evil mode
(use-package evil
  :config
  (evil-mode 1))

;; enable which-key
(use-package which-key
  :config
  (which-key-mode))

;;enable projectile
(use-package projectile
  :config
  (projectile-mode +1))
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; enable ido
(use-package ido
  :config
  (setq ido-everywhere t)
  (ido-mode 1))


;; magit
(use-package magit
  :bind ( ("C-x g" . magit-status)
	  )
  )


;; ess and polymode
(use-package ess)
(use-package markdown-mode)
(use-package polymode)
(use-package poly-R)
(use-package poly-noweb)
(use-package poly-markdown)


;;elpy
(use-package elpy
  :init
  (elpy-enable))

;; org
(use-package org
  :config
  (setq
   org-startup-indented t
   org-directory "~/org/"
   org-agenda-files '("~/org/")
   org-refile-targets '((nil :maxlevel . 9)
			(org-agenda-files :maxlevel . 9))
   )
  )
   

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))



; handling the visuals
;; set the theme
(use-package nord-theme)
;; disable scroll bar
(scroll-bar-mode -1)
;;disable blinking cursor
(blink-cursor-mode 0)
;; disable tool bar
(tool-bar-mode 0)
;; disable menu bar
(menu-bar-mode -1)
;; scrolling
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1)
;; lines
(add-hook 'text-mode-hook 'visual-line-mode)
(global-hl-line-mode 1)


(setq
 make-backup-files nil  ; stop creating backup~ files
 auto-save-default nil  ; stop creating #autosave# files
 create-lockfiles nil)  ; stop creating .# files



;; navigation
(global-set-key (kbd "M-j") 'evil-window-down)
(global-set-key (kbd "M-k") 'evil-window-up)
(global-set-key (kbd "M-h") 'evil-window-left)
(global-set-key (kbd "M-l") 'evil-window-right)



;; Simple AUCTex settings
(setq TeX-auto-save t)
(setq TeX-prase-self t)
