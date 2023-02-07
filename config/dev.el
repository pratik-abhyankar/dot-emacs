;;; dev.el --- Development config for Emacs -*- lexical-binding: t -*-

;; Author: Pratik Abhyankar
;; Maintainer: Pratik Abhyankar
;; Version: 1.0
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: dev, coding, editor, version control, project manager


;;; Commentary:
;; Adds a project manager, version control and other code editor features to
;; Emacs which makes it closer to being an IDE.


;;; Code:

;; Best version control tool out there.
(use-package magit
  :bind ("C-x g" . magit-status))

(use-package transient
  :config (setq transient-levels-file (pratik/set-custom-file "levels.el")
                transient-values-file (pratik/set-custom-file "values.el")
                transient-history-file (pratik/set-custom-file "history.el")))

(use-package git-gutter
  :config
  (global-git-gutter-mode t))

;; Project manager for Emacs.
(use-package projectile
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (setq projectile-switch-project-action #'projectile-dired)
  :config
  (setq projectile-completion-system 'ivy)
  (setq projectile-cache-file (pratik/set-custom-file "projectile-bookmarks.eld")
        projectile-known-projects-file (pratik/set-custom-file "projectile-known-projects.eld"))
  (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
  (add-to-list 'projectile-project-root-files-bottom-up "BUILD")
  (projectile-mode t))

(use-package counsel-projectile
  :after projectile counsel
  :bind ("C-x f" . counsel-projectile-find-file)
  :config
  (counsel-projectile-mode t))

;; IDE like sidebar.
(use-package treemacs
  :config
  (treemacs-project-follow-mode t)
  (treemacs-follow-mode t)
  (treemacs-git-mode 'extended)
  (treemacs-filewatch-mode t)
  (treemacs-indent-guide-mode t)
  (treemacs-resize-icons 18)
  :bind(("M-0" . treemacs-select-window)
        ("C-M-0" . treemacs)))

(use-package treemacs-projectile
  :after projectile treemacs)

(use-package treemacs-magit
  :after treemacs magit)

;; Language server protocol for languages to make Emacs IDE-like.
(use-package lsp-mode
  :init
  (setq lsp-server-install-dir (pratik/create-custom-dir ".cache/lsp/"))
  (setq lsp-session-file (pratik/set-custom-file ".lsp-session-v1"))
  :hook ((lsp-mode . lsp-enable-which-key-integration)
         (java-mode . lsp-deferred)
         (rust-mode . lsp-deferred)
         (python-mode . lsp-deferred)
         (web-mode . lsp-deferred)
         (go-mode . lsp-deferred)
         (elixir-mode . lsp-deferred)
         (json-mode . lsp-deferred)
         (markdown-mode . lsp-deferred)
         (svelte-mode . lsp-deferred))
  :commands (lsp lsp-deferred)
  :config
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map))

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)

(use-package dap-mode
  :init
  (setq dap-breakpoints-file (pratik/set-custom-file ".dap-breakpoints"))
	:config (dap-auto-configure-mode))

;; Best intergrated terminal emulator for Emacs.
(use-package vterm)

;; Snippets and templates for code block completions.
(use-package yasnippet
  :init
  :config
  (setq yas-snippet-dirs (list (pratik/create-custom-dir "snippets/")))
  (yas-global-mode t))

(use-package yasnippet-snippets
  :config
  (add-to-list 'yas-snippet-dirs yasnippet-snippets-dir))

(provide 'dev)
;;; dev.el ends here
