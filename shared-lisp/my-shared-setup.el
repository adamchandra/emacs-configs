(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

  ;; (unless package-archive-contents    ;; Refresh the packages descriptions
  ;;   (package-refresh-contents))
  ;; (setq package-load-list '(all))     ;; List of packages to load
  ;; (unless (package-installed-p 'org)  ;; Make sure the Org package is
  ;;   (package-install 'org))           ;; installed, install it if not
  (package-initialize)                ;; Initialize & Install Package

  )

(defconst *home-emacs-support* (expand-file-name "~/emacs/"))
(defconst *emacs-root*
      (cond
			 ((file-directory-p *home-emacs-support*) *home-emacs-support*)
			 (t nil)))

(defconst *site-lisp* (expand-file-name (concat *emacs-root* "site-lisp/")))
(defconst *bookmark-dir* (expand-file-name (concat *emacs-root* "bookmarks/")))
(defconst *orgfile-dir* (expand-file-name "~/projects/the-library/Dropbox/emacs-deft/"))

(setq deft-directory *orgfile-dir*)

(defconst *full-elisp-available* (not (null *emacs-root*)))
