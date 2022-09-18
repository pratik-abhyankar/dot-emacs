;;; bootstrap.el --- Bootstrap Emacs config -*- lexical-binding: t -*-

;; Author: Pratik Abhyankar
;; Maintainer: Pratik Abhyankar
;; Version: 1.0
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: bootstrap, better defaults


;;; Commentary:
;; Bootstraps Emacs startup with better defaults and a package manager.


;;; Code:

;; Bootstrap code for downloading and setting up 'straight.el' package manager.
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/master/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Make 'use-package' macro use 'straight.el' under the hood.
(straight-use-package 'use-package)
(use-package straight
  :custom (straight-use-package-by-default t))
(setq use-package-always-ensure t)

;; Sensible defaults is a collection of better default functions and keybindings.
(straight-use-package
 '(sensible-defaults :type git :host github :repo "hrs/sensible-defaults.el"))
(load-file "~/.emacs.d/straight/build/sensible-defaults/sensible-defaults.el")
(sensible-defaults/use-all-settings)
(sensible-defaults/use-all-keybindings)

;; Start Emacs in fullscreen mode.
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Clear the clutter from Emacs frame.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(setq-default
 inhibit-startup-screen t
 initial-scratch-message "")

;; Make Emacs a better code editor.
(global-display-line-numbers-mode)
(column-number-mode t)
(global-hl-line-mode t)

(display-battery-mode)
(display-time-mode)

(setq-default frame-title-format '("%b [%m]"))

(setq-default
 tab-always-indent 'complete
 indent-tabs-mode nil
 indent-line-function 'insert-tab
 tab-width 2)

(setq-default
 auto-save-default nil
 auto-save-list-file-prefix nil
 make-backup-files nil
 create-lockfiles nil)

(setq-default
 select-enable-clipboard t
 mouse-yank-at-point t
 kill-whole-line t)

(setq-default help-window-select t)

;; Ignore buffers that start with '*' when switching buffers.
(set-frame-parameter (selected-frame) 'buffer-predicate
                     (lambda (buf) (not (string-match-p "^*" (buffer-name buf)))))

;; Better default keybindings for better buffer management.
(bind-key "M-[" 'previous-buffer)
(bind-key "M-]" 'next-buffer)
(bind-key "M-o" 'other-window)
(bind-key "M-`" 'other-frame)
(bind-key "RET" 'newline-and-indent)
(bind-key "C-x k" 'kill-current-buffer)

;; Sync the sytem PATH variable with Emacs.
(use-package exec-path-from-shell
	:config
	(when (memq window-system '(mac ns x))
		(exec-path-from-shell-initialize))
	(when (daemonp)
		(exec-path-from-shell-initialize)))

(server-start)

(provide 'bootstrap)
;;; bootstrap.el ends here.
