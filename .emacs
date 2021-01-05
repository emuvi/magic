;;;; package --- Sumary:
;;;; Emacs Configuration

;;;; Commentary:
;;;; Emuvs Style

;;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(bookmark-save-flag 1)
 '(delete-selection-mode t)
 '(dired-listing-switches "-lah")
 '(display-fill-column-indicator t)
 '(fill-column 84)
 '(inhibit-startup-screen nil)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(org-support-shift-select t)
 '(package-selected-packages
	 '(dap-firefox dap-chrome dap-node dap-php dap-go dap-lldb dap-python dap-java helm-lsp lsp-treemacs rainbow-mode yasnippet lsp-java dap-mode lsp-ui lsp-mode company highlight-parentheses beacon telephone-line magit ag helm-swoop helm-ag helm-projectile helm flycheck treemacs-projectile treemacs centaur-tabs expand-region which-key use-package rich-minority projectile popup dashboard auto-package-update async))
 '(show-paren-mode t)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(visible-bell t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-interval 4)
  (auto-package-update-maybe))

(use-package leuven-theme
  :config
  (load-theme 'leuven t))

(use-package which-key
  :config
  (which-key-setup-side-window-right-bottom)
  (which-key-mode))

(use-package expand-region
  :bind
  ("C-=" . er/expand-region)
  ("C--" . er/contract-region))

(use-package beacon
  :config
  (beacon-mode t))

(use-package rainbow-mode
  :config
  (add-hook 'after-init-hook #'rainbow-mode))

(use-package highlight-parentheses
  :config
  (highlight-parentheses-mode t))

(use-package telephone-line
  :config
  (telephone-line-mode 1))

(use-package projectile
  :config
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  (projectile-mode +1))

(use-package dashboard
  :config
  (setq dashboard-items '((projects . 5)
                          (recents  . 5)
                          (bookmarks . 5)
                          (agenda . 5)))
  (setq dashboard-center-content t)
  (dashboard-setup-startup-hook))

(use-package treemacs
  :config
  (setq treemacs-is-never-other-window t)
  :bind
  (:map global-map
        ([f8] . treemacs)
        ("M-g M-t" . treemacs-select-window)))

(use-package treemacs-projectile
  :after treemacs projectile)

(use-package centaur-tabs
  :after projectile
  :config
  (setq centaur-tabs-set-bar 'over)
  (setq centaur-tabs-set-modified-marker t)
  (setq centaur-tabs-modified-marker "&")
  (centaur-tabs-group-by-projectile-project)
  (centaur-tabs-mode t)
  :bind
  (:map global-map
        ("M-g M-b" . 'centaur-tabs-backward)
        ("M-g M-f" . 'centaur-tabs-forward)))

(use-package windmove
  :bind
  ("C-x <up>" . windmove-up)
  ("C-x <down>" . windmove-down)
  ("C-x <left>" . windmove-left)
  ("C-x <right>" . windmove-right))

(use-package helm
  :init
  (require 'helm-config)
  :config
  (setq helm-split-window-inside-p t)
  (setq helm-split-window-default-side 'below)
  (setq helm-input-idle-delay 0.01)
  (helm-mode 1)
  :bind (("M-x" . helm-M-x)
         ("C-x C-m" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x f" . helm-recentf)
         ("C-x v" . helm-projectile)
         ("C-x c o" . helm-occur)
         ("C-x c p" . helm-projectile-ag)
         ("C-x c k" . helm-show-kill-ring)
         :map helm-map
         ("<tab>" . helm-execute-persistent-action)))

(use-package ag)

(use-package helm-ag
  :after (ag helm)
  :init (setq helm-ag-fuzzy-match t))

(use-package helm-projectile
  :bind ("M-t" . helm-projectile-find-file)
  :config
  (helm-projectile-on))

(use-package helm-swoop
  :bind
  ("C-x c s" . helm-swoop))

(use-package flycheck
  :init
	(global-flycheck-mode)
	:bind
  ("M-s n" . flycheck-next-error)
  ("M-s p" . flycheck-previous-error)
  :config
  (setq flycheck-display-errors-delay 1)
  (setq flycheck-highlighting-mode 'lines)
  (setq flycheck-check-syntax-automatically '(save))
  (set-face-attribute 'flycheck-error nil :underline '(:color "red3" :style wave))
  (set-face-attribute 'flycheck-warning nil :underline '(:color "orange2" :style wave)))

(use-package magit
  :bind
  ("C-x g s" . magit-status)
  ("C-x g x" . magit-checkout)
  ("C-x g c" . magit-commit)
  ("C-x g h" . magit-push)
  ("C-x g l" . magit-pull)
  ("C-x g e" . magit-ediff-resolve)
  ("C-x g r" . magit-rebase-interactive))

(use-package company
  :init
  (setq company-echo-delay 0)
  (setq company-idle-delay 0.1)
	(setq company-tooltip-limit 12)
	(setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t)	
  (add-hook 'after-init-hook 'global-company-mode))

(use-package lsp-mode
  :after projectile
  :commands lsp
  :hook((python-mode . lsp)
        (java-mode . lsp)
				(lsp-mode . lsp-enable-which-key-integration))
	:init
	(setq lsp-keymap-prefix "C-c l")
	(setq lsp-enable-snippet t)
  :bind (:map lsp-mode-map
							("C-c l A" . helm-lsp-code-actions)
							("C-c l w" . helm-lsp-workspace-symbol)
              ("C-c l W" . helm-lsp-global-workspace-symbol)))


(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-show-with-mouse nil)
  (setq lsp-ui-doc-show-with-cursor nil)
	(setq lsp-ui-sideline-show-code-actions nil)
  (setq lsp-ui-doc-position 'bottom)
  :bind
  ("M-s d" . lsp-ui-doc-show)
  ("M-s D" . lsp-ui-doc-hide)
  ("M-s f" . lsp-ui-doc-focus-frame)
  ("M-s F" . lsp-ui-doc-unfocus-frame)
  ("M-s m" . lsp-ui-imenu)
  ("M-s M" . lsp-ui-imenu--kill))

(use-package lsp-treemacs
	:commands lsp-treemacs-errors-list)

(use-package helm-lsp)

(use-package lsp-java
	:config
	(add-to-list 'lsp-java-vmargs "--enable-preview"))

(use-package dap-mode
  :after lsp-mode
  :config
	(dap-auto-configure-mode)
	(dap-register-debug-template "Java Runner"
                             (list :type "java"
                                   :request "launch"
                                   :args ""
                                   :vmArgs "--enable-preview"
                                   :projectName nil
                                   :mainClass nil)))

(use-package dap-java
	:ensure nil)

(use-package dap-python
	:ensure nil)

(use-package dap-lldb
	:ensure nil)

(use-package dap-go
	:ensure nil)

(use-package dap-php
	:ensure nil)

(use-package dap-node
	:ensure nil)

(use-package dap-chrome
	:ensure nil)

(use-package dap-firefox
	:ensure nil)

(use-package yasnippet
	:config (yas-global-mode))

(defun indent-buffer ()
  "Indent the contents of a buffer."
  (interactive)
  (save-excursion
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max))))

(provide '.emacs)
;;; .emacs ends here
