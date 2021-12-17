; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;
;;                                                                             ;;
;; Startup                                                                     ;;
;;                                                                             ;;
;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;


(setq default-directory "~/Code/")
(add-to-list 'load-path (concat default-directory "cmds/magic/emacs"))
(load-library "pointel-utils")

(setq backup-directory-alist `(("." . "~/.emacs.d/emacs_backup")))
(setq backup-by-copying t)
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq version-control t)


;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;
;;                                                                             ;;
;; UI settings                                                                 ;;
;;                                                                             ;;
;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;


(setq inhibit-startup-message t)   
(setq visible-bell 1)
(global-hl-line-mode 1)             
(menu-bar-mode -1)
(tooltip-mode -1)

(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode 0))
(when (fboundp 'set-fringe-mode) (set-fringe-mode 10))

;; Line/column numbers
(global-display-line-numbers-mode t)
(column-number-mode t)

;; Disable line numbers for:
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq-default indent-tabs-mode t)
(setq indent-line-function 'insert-tab)
(setq-default tab-width 4)


;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;
;;                                                                             ;;
;; Encoding settings                                                              ;;
;;                                                                             ;;
;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;


(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))


;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;
;;                                                                             ;;
;; Theme settings                                                              ;;
;;                                                                             ;;
;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;


(set-face-attribute 'default nil :font "Source Code Pro" :height 140 :weight 'bold)

(set-face-attribute 'font-lock-keyword-face nil :foreground "darkred")
(set-face-attribute 'font-lock-type-face nil :foreground "darkmagenta")
(set-face-attribute 'font-lock-function-name-face nil :foreground "darkblue")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "black")
(set-face-attribute 'font-lock-string-face nil :foreground "darkgreen")
(set-face-attribute 'font-lock-constant-face nil :foreground "brown")
(set-face-attribute 'font-lock-preprocessor-face nil :foreground "darkgray")
(set-face-attribute 'font-lock-comment-face nil :foreground "gray")


;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;
;;                                                                             ;;
;; Keybindings                                                                 ;;
;;                                                                             ;;
;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;


;; General more common keybindings
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Rebind C-u
    ;; Default for 'universal-argument' is C-u
    ;; Vim (EvilMode) uses C-u for scrolling
    ;; Rebind 'universal-argument' to C-M-u
(global-set-key (kbd "C-M-u") 'universal-argument)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Shell general keybindings
(global-set-key (kbd "C-x x b") 'eval-buffer)
(global-set-key (kbd "C-x x e") 'eshell)
(global-set-key (kbd "C-x x x") 'eshell-new)
(global-set-key (kbd "C-x x s") 'shell)

;; Window general keybindings
(global-set-key (kbd "C-x w =") 'balance-windows)
(global-set-key (kbd "C-x w +") 'window-bigger)
(global-set-key (kbd "C-x w -") 'window-lesser)

;; Window resize keybindings
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Move lines keybindings
(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)


;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;
;;                                                                             ;;
;; Initialize package sources                                                  ;;
;;                                                                             ;;
;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;


(require 'package)                  ;; Initializes the package system

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents    ;; Refresh the packages descriptions
  (package-refresh-contents))

(setq package-load-list '(all))     ;; List of packages to load

;; 'Use-package' makes it easier to initialize and configurate packages.
;; Source: github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))


;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;
;;                                                                             ;;
;; Use Packages                                                                ;;
;;                                                                             ;;
;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;


(require 'use-package)
(setq use-package-always-ensure t)

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-interval 10)
  (auto-package-update-maybe))

(use-package diminish)

(use-package ivy 
  :diminish
  :init
  (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-wrap t)
  (setq ivy-count-format "(%d/%d) ")
  (setq enable-recursive-minibuffers t)
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-f" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill)))

;; Add information to M-x
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

;; Connect M-x to ivy-rich
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-x f". counsel-recentf)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x w s" . counsel-switch-buffer)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start search with ^

(use-package company
  :config
  (setq company-echo-delay 0)
  (setq company-idle-delay 0.5)
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-limit 9)
  (global-company-mode 1)
  (global-set-key (kbd "C-<tab>") 'company-complete))

(use-package company-web
  :config
  (add-to-list 'company-backends 'company-web-html)
  (add-to-list 'company-backends 'company-web-jade)
  (add-to-list 'company-backends 'company-web-slim))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1.0))

(use-package windmove
  :bind
  ("C-x <up>" . windmove-up)
  ("C-x <down>" . windmove-down)
  ("C-x <left>" . windmove-left)
  ("C-x <right>" . windmove-right))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  (setq evil-respect-visual-line-mode t)
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-redo)

  (define-key evil-insert-state-map (kbd "M-h") 'evil-backward-word-begin)
  (define-key evil-insert-state-map (kbd "M-l") 'evil-forward-word-end)
  (define-key evil-insert-state-map (kbd "M-k") 'evil-backward-sentence-begin)
  (define-key evil-insert-state-map (kbd "M-j") 'evil-forward-sentence-begin)
  (define-key evil-normal-state-map (kbd "M-h") 'evil-backward-word-begin)
  (define-key evil-normal-state-map (kbd "M-l") 'evil-forward-word-end)
  (define-key evil-normal-state-map (kbd "M-k") 'evil-backward-sentence-begin)
  (define-key evil-normal-state-map (kbd "M-j") 'evil-forward-sentence-begin)

  (define-key evil-insert-state-map (kbd "M-y") 'evil-backward-WORD-begin)
  (define-key evil-insert-state-map (kbd "M-o") 'evil-forward-WORD-end)
  (define-key evil-insert-state-map (kbd "M-i") 'evil-backward-paragraph)
  (define-key evil-insert-state-map (kbd "M-u") 'evil-forward-paragraph)
  (define-key evil-normal-state-map (kbd "M-y") 'evil-backward-WORD-begin)
  (define-key evil-normal-state-map (kbd "M-o") 'evil-forward-WORD-end)
  (define-key evil-normal-state-map (kbd "M-i") 'evil-backward-paragraph)
  (define-key evil-normal-state-map (kbd "M-u") 'evil-forward-paragraph)

  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-commentary
  :after evil
  :init
  (evil-commentary-mode))
    ;; [gcc]  comments out a line
    ;; [gc]   comments out selection
    ;; [gcap] comments out a paragraph

;; Evil settings for lots of modes
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package org
  :after evil
  :defer t
  :config
  (evil-define-key '(normal insert visual) org-mode-map (kbd "C-j") 'org-next-visible-heading)
  (evil-define-key '(normal insert visual) org-mode-map (kbd "C-k") 'org-previous-visible-heading)
  (evil-define-key '(normal insert visual) org-mode-map (kbd "M-j") 'org-metadown)
  (evil-define-key '(normal insert visual) org-mode-map (kbd "M-k") 'org-metaup))

(use-package doom-themes 
  :defer t
  :config
  (load-theme 'doom-one-light t)
  (doom-themes-visual-bell-config))

(use-package doom-modeline
  :config 
  (setq doom-modeline-icon nil)
  (setq doom-modeline-major-mode-color-icon nil)
  (setq doom-modeline-buffer-modification-icon nil)
  :init 
  (doom-modeline-mode 1))

(use-package projectile
  :config
  (projectile-mode 1)
  (setq projectile-project-search-path '(default-directory))
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map))

(use-package flymake
  :bind
  ("C-x g w" . flymake-show-diagnostics-buffer))

(use-package magit
  :bind
  ("C-x g x" . magit-checkout)
  ("C-x g l" . magit-pull)
  ("C-x g s" . magit-status)
  ("C-x g S" . magit-stage)
  ("C-x g f" . magit-stage-file)
  ("C-x g m" . magit-stage-modified)
  ("C-x g u" . magit-stage-untracked)
  ("C-x g c" . magit-commit)
  ("C-x g h" . magit-push)
  ("C-x g e" . magit-ediff-resolve)
  ("C-x g r" . magit-rebase-interactive))

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :custom ((dired-listing-switches "-ago --group-directories-first"))
  :config
    (put 'dired-find-alternate-file 'disabled nil)
    (evil-collection-define-key 'normal 'dired-mode-map
      "h" 'dired-single-up-directory
      "l" 'dired-single-buffer))

(use-package dired-single)

(use-package autorevert
  :config
  (setq global-auto-revert-non-file-buffers t)
  (setq auto-revert-verbose nil)
  (global-auto-revert-mode))

(use-package dashboard
  :init
  (add-hook 'after-init-hook 'dashboard-refresh-buffer)
  :config
  (setq dashboard-banner-logo-title "Welcome to Pointel Emacs Dashboard!")
  (setq dashboard-items '((agenda . 5)
                          (bookmarks . 5)
                          (projects . 5)
                          (recents  . 5)))
  (setq dashboard-center-content t)
  (setq dashboard-set-heading-icons nil)
  (setq dashboard-set-file-icons nil)
  (setq dashboard-footer-icon "*")
  (setq dashboard-projects-switch-function 'dired)
  (setq dashboard-footer-messages (read-lines (concat default-directory "cmds/magic/emacs/messages.txt")))
  (dashboard-setup-startup-hook))


;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;
;;                                                                             ;;
;; Language Server Protocol (LSP)                                              ;;
;;                                                                             ;;
;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;


(use-package lsp-mode
  :after projectile
  :commands lsp
  :hook((markdown-mode .lsp)
		(typescript-mode . lsp)
        (json-mode. lsp)
        (css-mode . lsp)
        (web-mode . lsp)
        (php-mode . lsp)
        (python-mode . lsp)
        (groovy-mode . lsp)
        (java-mode . lsp)
        (go-mode . lsp)
        (rust-mode . lsp)
		(lua-mode . lsp)
        (cmake-mode . lsp)
        (c++-mode . lsp)
        (c-mode . lsp)
        (lsp-mode . lsp-enable-which-key-integration))
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-enable-snippet t)
  (setq lsp-signature-auto-activate t)
  (setq lsp-signature-doc-lines 1)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-modeline-code-actions-enable nil)
  (setq lsp-modeline-diagnostics-enable nil)
  :config
  (set-face-attribute 'lsp-face-highlight-read nil :background "lightblue")
  (set-face-attribute 'lsp-face-highlight-textual nil :background "lightblue")
  (set-face-attribute 'lsp-face-highlight-write nil :background "lightblue")
  :bind (:map lsp-mode-map
              ("C-c l A" . helm-lsp-code-actions)
              ("C-c l w" . helm-lsp-workspace-symbol)
              ("C-c l W" . helm-lsp-global-workspace-symbol)))

(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-doc-show-with-mouse nil)
  (setq lsp-ui-doc-show-with-cursor nil)
  (setq lsp-ui-doc-position 'top)
  :bind
  ("M-s s s" . lsp-ui-sideline-mode)
  ("M-s s a" . 'lsp-ui-sideline-apply-code-actions)
  ("M-s s d" . lsp-ui-doc-show)
  ("M-s s f" . lsp-ui-doc-focus-frame)
  ("M-s s F" . lsp-ui-doc-unfocus-frame)
  ("M-s s m" . lsp-ui-imenu)
  ("M-s s M" . lsp-ui-imenu--kill))

(use-package markdown-mode
  :mode ("\\.\\(m\\(ark\\)?down\\|md\\)$" . markdown-mode)
  :hook (markdown-mode . lsp))
  
(use-package typescript-mode
  :mode (("\\.js\\'" . typescript-mode)
         ("\\.jsx\\'" . typescript-mode)
         ("\\.ts\\'" . typescript-mode)
         ("\\.tsx\\'" . typescript-mode))
  :hook
  (typescript-mode . lsp))

(use-package json-mode
  :mode "\\.json\\'"
  :hook
  (json-mode . lsp))

(use-package css-mode
  :mode "\\.css\\'"
  :hook
  (css-mode . lsp))

(use-package web-mode
  :mode (("\\.htm\\'" . web-mode)
         ("\\.html\\'" . web-mode))
  :hook
  (web-mode . lsp))

(use-package php-mode
  :mode (("\\.php\\'" . php-mode)
         ("\\.phtm\\'" . php-mode)
         ("\\.phtml\\'" . php-mode))
  :hook
  (php-mode . lsp))

(use-package mmm-mode
  :defer t
  :config
  (setq mmm-global-mode 'maybe)
  (mmm-add-mode-ext-class 'html-mode "\\.php\\'" 'html-php)
  (mmm-add-mode-ext-class 'html-mode "\\.phtm\\'" 'html-php)
  (mmm-add-mode-ext-class 'html-mode "\\.phtml\\'" 'html-php))

(use-package python-mode
  :mode ("\\.py\\'" . python-mode))

(use-package groovy-mode
  :mode ("\\.groovy\\'" . groovy-mode)
  :hook
  (groovy-mode . lsp))

(use-package lsp-java
  :hook
  (java-mode . lsp)
  :config
  (setq lsp-java-format-settings-url (lsp--path-to-uri (concat default-directory "magic/java-pointel-style.xml")))
  (setq lsp-java-format-settings-profile "PointelStyle"))

(use-package go-mode
  :mode "\\.go\\'"
  :hook
  (go-mode . lsp))

(use-package rust-mode
  :mode "\\.rs\\'"
  :hook
  (rust-mode . lsp))

(use-package lua-mode
  :mode (("\\.lua\\'" . lua-mode)
		 ("\\.liz\\'" . lua-mode))
  :hook
  (lua-mode . lsp))

(use-package cmake-mode
  :mode (("CMakeLists\\.txt\\'" . cmake-mode)
         ("\\.cmake\\'" . cmake-mode)))

(use-package cmake-font-lock
  :after cmake-mode
  :hook (cmake-mode . cmake-font-lock-activate))

(use-package modern-cpp-font-lock
  :hook
  (c++-mode . modern-c++-font-lock-mode))

(use-package dap-mode
  :after lsp-mode
  :config
  (dap-auto-configure-mode)
  :bind
  ("<f5>" . 'dap-debug-last)
  ("<C-f5>" . 'dap-disconnect)
  ("<f6>" . 'dap-continue)
  ("<f7>" . 'dap-next)
  ("<f8>" . 'dap-step-in)
  ("<C-f8>" . 'dap-step-out))

(use-package dap-firefox
  :ensure dap-mode)

(use-package dap-chrome
  :ensure dap-mode)

(use-package dap-node
  :ensure dap-mode)

(use-package dap-php
  :ensure dap-mode)

(use-package dap-python
  :ensure dap-mode
  :hook
  ((python-mode . dap-mode)
   (python-mode . dap-ui-mode)
   (python-mode . dap-tooltip-mode)))

(use-package dap-java
  :ensure dap-mode
  :hook
  ((java-mode . dap-mode)
   (java-mode . dap-ui-mode)
   (java-mode . dap-tooltip-mode)))

(use-package dap-go
  :ensure dap-mode
  :hook
  ((go-mode . dap-mode)
   (go-mode . dap-ui-mode)
   (go-mode . dap-tooltip-mode)))

(use-package dap-gdb-lldb
  :ensure dap-mode
  :hook
  ((c-mode . dap-mode)
   (c-mode . dap-ui-mode)
   (c-mode . dap-tooltip-mode)
   (c++-mode . dap-mode)
   (c++-mode . dap-ui-mode)
   (c++-mode . dap-tooltip-mode)))


;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;
;;                                                                             ;;
;; Snippets                                                                    ;;
;;                                                                             ;;
;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;


(use-package yasnippet
  :config (yas-global-mode))

(use-package yasnippet-snippets
  :after yasnippet
  :demand t
  :config
  (yas-reload-all))

(with-eval-after-load 'company-mode
    (add-to-list 'company-backends '(company-yasnippet)))

(use-package emmet-mode
  :hook ((typescript-mode . emmet-mode)
         (css-mode  . emmet-mode)
         (web-mode  . emmet-mode)
         (php-mode  . emmet-mode)))

(use-package hippie-exp
  :bind ("<C-return>" . hippie-expand)
  :config
  (setq-default hippie-expand-try-functions-list
                '(yas-hippie-try-expand
                  emmet-hippie-try-expand-line)))

(defun emmet-hippie-try-expand-line (args)
  "Includes another emmet handler with ARGS."
  (interactive "P")
  (when emmet-mode
    (emmet-expand-line args)))


;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;
;;                                                                             ;;
;; Customs                                                                     ;;
;;                                                                             ;;
;; ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~ ;;


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(emmet-mode yasnippet-snippets yasnippet modern-cpp-font-lock cmake-font-lock cmake-mode lua-mode rust-mode go-mode lsp-java groovy-mode python-mode mmm-mode php-mode web-mode json-mode typescript-mode lsp-ui lsp-mode magit projectile doom-modeline doom-themes evil-collection evil-commentary evil org-bullets helpful which-key company-web company counsel ivy-rich ivy diminish dashboard auto-package-update use-package)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
