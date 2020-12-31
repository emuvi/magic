(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bookmark-save-flag 1)
 '(display-fill-column-indicator t)
 '(fill-column 84)
 '(inhibit-startup-screen nil)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(org-support-shift-select t)
 '(package-selected-packages
   '(flycheck company treemacs-projectile treemacs centaur-tabs expand-region which-key use-package rich-minority projectile powerline popup dashboard auto-package-update async))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)

(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package auto-package-update
   :ensure t
   :config
   (setq auto-package-update-delete-old-versions t)
   (setq auto-package-update-interval 4)
   (auto-package-update-maybe))

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package powerline
  :ensure t
  :config (powerline-default-theme))

(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode t)

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  (projectile-mode +1))

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-items '((projects . 5)
			  (recents  . 5)
			  (bookmarks . 5)
			  (agenda . 5)))
  (setq dashboard-center-content t)
  (dashboard-setup-startup-hook))

(use-package treemacs
  :ensure t
  :config
  (setq treemacs-is-never-other-window t)
  :bind
  (:map global-map
	([f8] . treemacs)
	("C-c t" . treemacs-select-window)))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package expand-region
  :ensure t
  :bind
  ("C-=" . er/expand-region)
  ("C--" . er/contract-region))

(use-package centaur-tabs
  :ensure t
  :config
  (setq centaur-tabs-set-bar 'over)
  (setq centaur-tabs-set-modified-marker t)
  (setq centaur-tabs-modified-marker "&")
  (centaur-tabs-group-by-projectile-project)
  (centaur-tabs-mode t)
  :bind
  (:map global-map
	("C-c b" . 'centaur-tabs-backward)
	("C-c f" . 'centaur-tabs-forward)))

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))
