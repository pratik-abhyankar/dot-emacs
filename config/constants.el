;;; constants.el --- Defines all required constants for the Emacs config -*- lexical-binding: t -*-

;; Author: Pratik Abhyankar
;; Maintainer: Pratik Abhyankar
;; Version: 1.0
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: constants

;;; Commentary:


;;; Code:

;; Define constants to identify system type
(defconst NATIVECOMP (if (fboundp 'native-comp-available-p) (native-comp-available-p)))
(defconst EMACS28+   (> emacs-major-version 27))
(defconst EMACS29+   (> emacs-major-version 28))
(defconst IS-MAC     (eq system-type 'darwin))
(defconst IS-LINUX   (eq system-type 'gnu/linux))
(defconst IS-WINDOWS (memq system-type '(cygwin windows-nt ms-dos)))
(defconst IS-BSD     (or IS-MAC (eq system-type 'berkeley-unix)))

;; Define file and directory path constants.
(defconst CONFIG-DIR-NAME "config/")

(defconst CUSTOM-DIR-NAME "custom/")
(defconst CUSTOM-DIR (expand-file-name (concat user-emacs-directory CUSTOM-DIR-NAME)))
(unless (file-directory-p CUSTOM-DIR)
  (make-directory CUSTOM-DIR))

(defconst SPELL-FU-DIR-NAME "spell-fu/")
(defconst SPELL-FU-DIR (expand-file-name (concat CUSTOM-DIR SPELL-FU-DIR-NAME)))
(unless (file-directory-p SPELL-FU-DIR)
  (make-directory SPELL-FU-DIR))

(defconst ECLIPSE-DIR-NAME "eclipse.jdt.ls/")
(defconst ECLIPSE-DIR (expand-file-name (concat CUSTOM-DIR ECLIPSE-DIR-NAME)))
(unless (file-directory-p ECLIPSE-DIR)
  (make-directory ECLIPSE-DIR))
(defconst JAVA-WORKSPACE-DIR-NAME "workspace/")
(defconst JAVA-WORKSPACE-DIR (expand-file-name (concat CUSTOM-DIR JAVA-WORKSPACE-DIR-NAME)))
(unless (file-directory-p JAVA-WORKSPACE-DIR)
  (make-directory JAVA-WORKSPACE-DIR))

(defconst LSP-CACHE-DIR-NAME ".cache/")
(defconst LSP-CACHE-DIR (expand-file-name (concat CUSTOM-DIR LSP-CACHE-DIR-NAME)))
(unless (file-directory-p LSP-CACHE-DIR)
  (make-directory LSP-CACHE-DIR))
(defconst LSP-DIR-NAME "lsp/")
(defconst LSP-DIR (expand-file-name (concat LSP-CACHE-DIR LSP-DIR-NAME)))
(unless (file-directory-p LSP-DIR)
  (make-directory LSP-DIR))

(defconst YASNIPPETS-DIR-NAME "snippets/")
(defconst YASNIPPETS-DIR (expand-file-name (concat CUSTOM-DIR YASNIPPETS-DIR-NAME)))
(unless (file-directory-p YASNIPPETS-DIR)
  (make-directory YASNIPPETS-DIR))

(defconst ORG-DIR "~/org/")
(unless (file-directory-p ORG-DIR)
  (make-directory ORG-DIR))
(defconst WORK-ORG-FILE (expand-file-name "work/work.org" ORG-DIR))
(defconst PERSONAL-ORG-FILE (expand-file-name "personal/personal.org" ORG-DIR))
(defconst ORG-ARCHIVE-LOC (concat ORG-DIR "archive/" "%s_archive::"))
(defconst ORG-ROAM-DIR-NAME "roam/")
(defconst ORG-ROAM-DIR (expand-file-name (concat ORG-DIR ORG-ROAM-DIR-NAME)))
(unless (file-directory-p ORG-ROAM-DIR)
  (make-directory ORG-ROAM-DIR))
(defconst ORG-ROAM-DB (expand-file-name "org-roam.db" ORG-ROAM-DIR))

(defconst CUSTOM-FILE (expand-file-name "custom-file.el" CUSTOM-DIR))
(defconst COMPANY-STATISTICS-CACHE-FILE (expand-file-name "company-statistics-cache.el" CUSTOM-DIR))
(defconst RECENTF-FILE (expand-file-name "recentf" CUSTOM-DIR))
(defconst AMX-ITEMS-FILE (expand-file-name "amx-items" CUSTOM-DIR))
(defconst PROJECTILE-BOOKMARKS-FILE (expand-file-name "projectile-bookmarks.eld" CUSTOM-DIR))
(defconst PROJECTILE-KNOWN-PROJECTS-FILE (expand-file-name "projectile-known-projects.eld" CUSTOM-DIR))
(defconst TRANSIENT-HISTORY-FILE (expand-file-name "history.el" CUSTOM-DIR))
(defconst TRANSIENT-VALUES-FILE (expand-file-name "values.el" CUSTOM-DIR))
(defconst TRANSIENT-LEVELS-FILE (expand-file-name "levels.el" CUSTOM-DIR))
(defconst LSP-SESSION-FILE (expand-file-name ".lsp-session-v1" CUSTOM-DIR))
(defconst DAP-BREAKPOINTS-FILE (expand-file-name ".dap-breakpoints" CUSTOM-DIR))

(provide 'constants)
;;; constants.el ends here
