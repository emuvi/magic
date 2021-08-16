;;;; package --- Summary:
;;;; Emacs Configuration

;;;; Commentary:
;;;; Emuvi Style

;;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bookmark-save-flag 1)
 '(c-basic-offset 2)
 '(create-lockfiles nil)
 '(delete-selection-mode t)
 '(dired-listing-switches "-lah")
 '(display-fill-column-indicator t)
 '(fill-column 90)
 '(global-linum-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen nil)
 '(lsp-headerline-breadcrumb-enable t)
 '(make-backup-files nil)
 '(org-support-shift-select t)
 '(package-selected-packages
   '(yasnippet-snippets groovy-mode lsp-treemacs python-mode emmet-mode company-web json-mode web-mode php-mode cmake-mode clang-format modern-cpp-font-lock cmake-font-lock vue-mode typescript-mode go-mode dap-firefox dap-chrome dap-node dap-php dap-go dap-lldb dap-python dap-java helm-lsp rainbow-mode yasnippet lsp-java dap-mode lsp-ui lsp-mode company highlight-parentheses beacon telephone-line magit ag helm-swoop helm-ag helm-projectile helm flycheck treemacs-projectile treemacs centaur-tabs expand-region which-key use-package rich-minority projectile popup dashboard auto-package-update async))
 '(php-mode-force-pear t)
 '(show-paren-mode t)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(visible-bell t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :weight bold))))
 '(centaur-tabs-selected ((t (:background "green" :foreground "blue"))))
 '(centaur-tabs-unselected ((t (:background "black" :foreground "darkgray"))))
 '(centaur-tabs-selected-modified ((t (:background "green" :foreground "blue"))))
 '(centaur-tabs-unselected-modified ((t (:background "black" :foreground "darkgray"))))
 '(lsp-face-highlight-read ((t (:background "darkgray"))))
 '(lsp-face-highlight-textual ((t (:background "darkgray"))))
 '(lsp-face-highlight-write ((t (:background "darkgray"))))
)

(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))

(require 'whitespace)
(setq whitespace-line-column 90)
(setq whitespace-style '(face lines-tail))
(global-whitespace-mode +1)

(defun eshell-new ()
  "Creates a new eshell buffer."
  (interactive)
  (eshell t))

(defun window-bigger ()
  "Make window bigger."
  (interactive)
  (enlarge-window 3))

(defun window-lesser ()
  "Make window lesser."
  (interactive)
  (enlarge-window -3))

(global-set-key (kbd "C-x x b") 'eval-buffer)
(global-set-key (kbd "C-x x e") 'eshell)
(global-set-key (kbd "C-x x x") 'eshell-new)
(global-set-key (kbd "C-x x s") 'shell)
(global-set-key (kbd "C-x =") 'balance-windows)
(global-set-key (kbd "C-x +") 'window-bigger)
(global-set-key (kbd "C-x -") 'window-lesser)

;; Shift and click with mouse select the region.
(define-key global-map (kbd "<S-down-mouse-1>") 'mouse-save-then-kill)

(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

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
  :config
  (which-key-setup-side-window-right-bottom)
  (which-key-mode))

(use-package expand-region
  :ensure t
  :bind
  ("C-=" . er/expand-region)
  ("C--" . er/contract-region))

(use-package ace-link
  :ensure t
  :init
  (ace-link-setup-default))

(use-package ace-window
  :ensure t
  :bind
  ("C-x o" . ace-window)
  :diminish  ace-window-mode)

(use-package windmove
  :ensure t
  :bind
  ("C-x <up>" . windmove-up)
  ("C-x <down>" . windmove-down)
  ("C-x <left>" . windmove-left)
  ("C-x <right>" . windmove-right))

(use-package beacon
  :ensure t
  :config
  (beacon-mode t))

(use-package rainbow-mode
  :ensure t
  :config
  (add-hook 'after-init-hook #'rainbow-mode))

(use-package highlight-parentheses
  :ensure t
  :config
  (highlight-parentheses-mode t))

(use-package telephone-line
  :ensure t
  :config
  (setq telephone-line-primary-left-separator 'telephone-line-nil
      telephone-line-secondary-left-separator 'telephone-line-nil
      telephone-line-primary-right-separator 'telephone-line-nil
      telephone-line-secondary-right-separator 'telephone-line-nil)
  (telephone-line-mode 1))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map))

(use-package treemacs
  :ensure t
  :after projectile
  :config
  (setq treemacs-is-never-other-window t)
  :bind
  ("<f12>" . treemacs)
  ("M-s M-t" . treemacs-select-window))

(use-package treemacs-projectile
  :ensure t
  :after treemacs)

(use-package dashboard
  :ensure t
  :after treemacs
  :config
  (setq dashboard-items '((projects . 5)
                          (recents  . 5)
                          (bookmarks . 5)
                          (agenda . 5)))
  (setq dashboard-center-content t)
  (dashboard-setup-startup-hook))

(use-package centaur-tabs
  :ensure t
  :after dashboard
  :config
  (setq centaur-tabs-set-bar 'over)
  (setq centaur-tabs-set-modified-marker t)
  (setq centaur-tabs-modified-marker "&")
  (centaur-tabs-group-by-projectile-project)
  (centaur-tabs-mode t)
  :bind
  (:map global-map
        ("M-s M-q" . 'centaur-tabs-backward)
        ("M-s M-e" . 'centaur-tabs-forward)))

(use-package helm
  :ensure t
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

(use-package ag
  :ensure t)

(use-package helm-ag
  :ensure t
  :after (ag helm)
  :init (setq helm-ag-fuzzy-match t)
  :bind
  (:map global-map
        ("M-s M-g" . helm-ag)))

(use-package helm-projectile
  :ensure t
  :bind ("M-t" . helm-projectile-find-file)
  :config
  (helm-projectile-on))

(use-package flycheck
  :ensure t
  :bind
  ("M-s c" . flycheck-mode)
  ("M-s n" . flycheck-next-error)
  ("M-s p" . flycheck-previous-error)
  :config
  (setq flycheck-display-errors-delay 2.0)
  (setq flycheck-highlighting-mode 'lines)
  (setq flycheck-check-syntax-automatically '(idle-change)))

(use-package magit
  :ensure t
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

(use-package company
  :ensure t
  :config
  (setq company-echo-delay 0)
  (setq company-idle-delay 1)
  (setq company-tooltip-limit 9)
  (setq company-minimum-prefix-length 3)
  (setq company-tooltip-align-annotations t)
  (global-company-mode 1)
  (global-set-key (kbd "C-<tab>") 'company-complete))

(use-package company-web
  :ensure t
  :config
  (add-to-list 'company-backends 'company-web-html)
  (add-to-list 'company-backends 'company-web-jade)
  (add-to-list 'company-backends 'company-web-slim))

(use-package lsp-mode
  :ensure t
  :after projectile
  :commands lsp
  :hook((typescript-mode . lsp)
        (json-mode. lsp)
        (css-mode . lsp)
        (web-mode . lsp)
        (php-mode . lsp)
        (python-mode . lsp)
        (groovy-mode . lsp)
        (java-mode . lsp)
        (go-mode . lsp)
		(rust-mode . lsp)
        (cmake-mode . lsp)
        (c++-mode . lsp)
        (c-mode . lsp)
        (lsp-mode . lsp-enable-which-key-integration))
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-enable-snippet t)
  (setq lsp-signature-auto-activate t)
  (setq lsp-signature-doc-lines 1)
  :bind (:map lsp-mode-map
              ("C-c l A" . helm-lsp-code-actions)
              ("C-c l w" . helm-lsp-workspace-symbol)
              ("C-c l W" . helm-lsp-global-workspace-symbol)))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-doc-show-with-mouse nil)
  (setq lsp-ui-doc-show-with-cursor nil)
  (setq lsp-ui-doc-position 'top)
  :bind
  ("M-s M-s" . lsp-ui-sideline-mode)
  ("M-s M-a" . 'lsp-ui-sideline-apply-code-actions)
  ("M-s M-d" . lsp-ui-doc-show)
  ("M-s M-f" . lsp-ui-doc-focus-frame)
  ("M-s M-F" . lsp-ui-doc-unfocus-frame)
  ("M-s M-m" . lsp-ui-imenu)
  ("M-s M-M" . lsp-ui-imenu--kill))

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

(use-package helm-lsp
  :ensure t
  :commands helm-lsp-workspace-symbol)

(use-package typescript-mode
  :ensure t
  :mode (("\\.js\\'" . typescript-mode)
         ("\\.jsx\\'" . typescript-mode)
         ("\\.ts\\'" . typescript-mode)
         ("\\.tsx\\'" . typescript-mode))
  :hook
  (typescript-mode . lsp)
  :config
  (setq-default typescript-indent-level 2))

(use-package json-mode
  :ensure t
  :mode "\\.json\\'"
  :hook
  (json-mode . lsp))

(use-package css-mode
  :ensure t
  :mode "\\.css\\'"
  :hook
  (css-mode . lsp)
  :config
  (setq css-indent-offset 2))

(use-package web-mode
  :ensure t
  :mode (("\\.htm\\'" . web-mode)
         ("\\.html\\'" . web-mode))
  :hook
  (web-mode . lsp)
  :config
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(use-package php-mode
  :ensure t
  :mode (("\\.php\\'" . php-mode)
         ("\\.phtm\\'" . php-mode)
         ("\\.phtml\\'" . php-mode))
  :hook
  (php-mode . lsp))

(use-package mmm-mode
  :ensure t
  :defer t
  :config
  (setq mmm-global-mode 'maybe)
  (mmm-add-mode-ext-class 'html-mode "\\.php\\'" 'html-php)
  (mmm-add-mode-ext-class 'html-mode "\\.phtm\\'" 'html-php)
  (mmm-add-mode-ext-class 'html-mode "\\.phtml\\'" 'html-php))

(use-package python-mode
  :ensure t
  :mode ("\\.py\\'" . python-mode)
  :config
  (setq python-indent-offset 4))

(use-package groovy-mode
  :ensure t
  :mode ("\\.groovy\\'" . groovy-mode)
  :hook
  (groovy-mode . lsp))

(use-package lsp-java
  :ensure t
  :hook
  (java-mode . lsp)
  :config
  (setq lsp-java-format-settings-url (lsp--path-to-uri "~/java-pointel-style.xml"))
  (setq lsp-java-format-settings-profile "PointelStyle"))

(use-package go-mode
  :ensure t
  :mode "\\.go\\'"
  :hook
  (go-mode . lsp))

(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :hook
  (rust-mode . lsp))

(use-package cmake-mode
  :ensure t
  :mode (("CMakeLists\\.txt\\'" . cmake-mode)
         ("\\.cmake\\'" . cmake-mode)))

(use-package cmake-font-lock
  :ensure t
  :after cmake-mode
  :hook (cmake-mode . cmake-font-lock-activate))

(use-package modern-cpp-font-lock
  :ensure t
  :hook
  (c++-mode . modern-c++-font-lock-mode))

(use-package dap-mode
  :ensure t
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

(use-package yasnippet
  :ensure t
  :config (yas-global-mode))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet
  :demand t
  :config
  (yas-reload-all))

(with-eval-after-load 'company-mode
    (add-to-list 'company-backends '(company-yasnippet)))

(use-package emmet-mode
  :ensure t
  :hook ((typescript-mode . emmet-mode)
         (css-mode  . emmet-mode)
         (web-mode  . emmet-mode)
         (php-mode  . emmet-mode)))

(use-package hippie-exp
  :ensure t
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

(defun indent-buffer ()
  "Indent the contents of a buffer."
  (interactive)
  (save-excursion
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max))))

(global-set-key [(meta s)(meta i)] 'indent-buffer)

(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(control shift up)]  'move-line-up)
(global-set-key [(control shift down)]  'move-line-down)

(global-set-key [(meta s)(meta c)] 'comment-region)
(global-set-key [(meta s)(meta u)] 'uncomment-region)

(defun query-replace-from-top ()
  "Replace with query on entire buffer."
  (interactive)
  (let ((orig-point (point)))
    (save-excursion
      (goto-char (point-min))
      (call-interactively 'query-replace))
    (goto-char orig-point)))

(bind-key* "C-M-%" 'query-replace-from-top)

(defun replace-from-top ()
  "Replace on entire buffer."
  (interactive)
  (let ((orig-point (point)))
    (save-excursion
      (goto-char (point-min))
      (call-interactively 'replace-string))
    (goto-char orig-point)))

(bind-key* "C-M-&" 'replace-from-top)


(provide '.emacs)
;;; .emacs ends here
