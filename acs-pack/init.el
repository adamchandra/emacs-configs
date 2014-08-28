;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.
;; Common lisp
(eval-when-compile
  (require 'cl))


(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  (package-initialize)                ;; Initialize & Install Package
  )

(defconst *orgfile-dir* (expand-file-name "~/projects/the-toolshed/emacsen/org-files/emacs-deft/"))
(setq deft-directory *orgfile-dir*)
;; (defconst *full-elisp-available* (not (null *emacs-root*)))


(live-load-config-file "unbindings.el")

;; Load bindings config
(live-load-config-file "ag-code-search.el")
;; (live-load-config-file "command-blocks.el")
;; (live-load-config-file "ecb-python.el")
;;(live-load-config-file "filesets-defs.el")
;; (live-load-config-file "highlight-indentation.el")
;; (live-load-config-file "icicles-install.el")
;; (live-load-config-file "jde-eclipse-compiler-server.el")
(live-load-config-file "mail-config.el")
;; (live-load-config-file "my-color-theme.el")
(live-load-config-file "my-emisc.el")
;;(live-load-config-file "my-java-config.el")
(live-load-config-file "my-javascript-config.el")
(live-load-config-file "my-lang-configs.el")
;;(live-load-config-file "my-lisp-config.el")

(live-load-config-file "my-org+deft-mode.el")
(live-load-config-file "org-life-in-plain-text.el")

(live-load-config-file "my-python-config.el")
(live-load-config-file "my-scala-config.el")
;;(live-load-config-file "my-shared-setup.el")
;;(live-load-config-file "my-yas.el")
(live-load-config-file "perl-config.el")
(live-load-config-file "skeleton_defs.el")
(live-load-config-file "smooth-scrolling.el")
(live-load-config-file "snippets.el")
(live-load-config-file "yasnippet-bundle.el")


;; (live-add-pack-lib "bar")
;; (require 'baz)





;; (defconst *home-emacs-support* (expand-file-name "~/emacs/"))
;; (defconst *emacs-root*
;;       (cond
;;         		 ((file-directory-p *home-emacs-support*) *home-emacs-support*)
;;         		 (t nil)))
;;
;; (defconst *site-lisp* (expand-file-name (concat *emacs-root* "site-lisp/")))
;; (defconst *bookmark-dir* (expand-file-name (concat *emacs-root* "bookmarks/")))

(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x" "C-c"))
(guide-key-mode 1)  ; Enable guide-key-mode
(setq guide-key/highlight-command-regexp "rectangle")
(setq guide-key/idle-delay 1.0)
(setq guide-key/recursive-key-sequence-flag t)



(require 'tramp)
(setq tramp-default-method "scpx")
;; (setq tramp-default-method "mosh")

;; 23.2 specific customizations:
(setq font-use-system-font t)
(setq tab-always-indent 'complete)

;; end 23.2 specific customizations:

(setq semantic-load-turn-useful-things-on t)
;; (partial-completion-mode)
(setq-default indent-tabs-mode nil)
(setq dired-use-ls-dired nil)
(setq c-basic-offset 2)
(defvar c-tab-always-indent nil)
(setq-default case-fold-search nil)
(defvar default-major-mode 'text-mode)
(set-variable 'tab-width 2)

;; Enable some default-disabled commands
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(setq
 find-file-compare-truenames t
 minibuffer-confirm-incomplete t
 minibuffer-max-depth nil
 )

;; pending-delete-mode causes typed text to replace a selection, rather than append
(pending-delete-mode t)

(setq dired-no-confirm '(byte-compile chgrp chmod chown compress copy delete hardlink load
                                      move print shell symlink uncompress recursive-delete kill-file-buffer
                                      kill-dired-buffer patch create-top-dir revert-subdirs))

(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.emacs.d/autosaves/"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(defvar cperl-mode-hook)
(defalias 'perl-mode 'cperl-mode)
(setq cperl-mode-hook 'my-cperl-customizations)
;; reinstate the older space-completion for files
(cond
 ((boundp 'minibuffer-local-filename-completion-map)
  (define-key minibuffer-local-filename-completion-map [(?\ )] 'minibuffer-complete)))

(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)
(icomplete-mode 1)
(column-number-mode)


(global-font-lock-mode t)
(when (fboundp 'winner-mode)
  (winner-mode 1))

;;(require 'compile-) (require 'compile) (require 'compile+)
;;(require 'grep+)
;;(require 'vline)  (require 'ag)
;;(require 'parenface)  (require 'redo+)
(require 'dired+)  (require 'dired-details)  (require 'dired-details+)
;;(require 'filecache)  (require 'picture)  (require 'yaml-mode)
;;(require 'bookmark+)  (require 'coffee-mode)  (require 'sws-mode)
;;(require 'less-css-mode)  (require 'jade-mode)  (require 'js2-mode)
;;(require 'undo-tree)  (require 'markdown-mode)  (require 'deft)
;;(require 'multifiles)  (require 'jira)

;;  (cua-selection-mode 1)
;; (setq cua-auto-tabify-rectangles nil)  ;; Don't tabify after rectangle commands

;;(setq cua-keep-region-after-copy nil)  ;; Standard Windows behaviour

(require 'window-number)
(require 'eproject) (require 'eproject-extras)

(require 'windata)
(require 'tree-mode)
(require 'dirtree)

(setq x-select-enable-clipboard t)
(global-undo-tree-mode)
(get 'overwrite-mode 'disabled)
(column-number-mode t)
(set-scroll-bar-mode 'right)
;; (smooth-scroll-mode t)
;; general elisp
;; (icy-mode nil)

;; scala mode stuff
(global-auto-revert-mode 1)
(require 'ensime)

(defun scala-mode-setup()
  (interactive)
  ;; (defun scala-mode-hook())
  ;; (add-hook 'scala-mode-hook 'scala-mode-hook)

  (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
  )

(scala-mode-setup)


(add-to-list 'auto-mode-alist '("\\.\\(scala\\|sbt\\|sc\\)$" . scala-mode))
(add-to-list 'auto-mode-alist '("\\.hs$"     . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.[hg]s$"  . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.hi$"     . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.l[hg]s$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.gp$"     . gnuplot-mode))
(add-to-list 'auto-mode-alist '("\\.ya?ml$"  . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile"   . coffee-mode))
;; significant whitespace mode
(add-to-list 'auto-mode-alist '("\\.styl$"   . sws-mode))
;; sws for yaml-like property files
(add-to-list 'auto-mode-alist '("\\.(props?|properties)$"   . sws-mode))

(add-to-list 'auto-mode-alist '("\\.less$"   . less-css-mode))
(add-to-list 'auto-mode-alist '("\\.jade$"   . jade-mode))
(add-to-list 'auto-mode-alist '("\\.scaml$"  . jade-mode))
;; (add-to-list 'auto-mode-alist '("\\.js$"     . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js$"     . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.md"      . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.\\(xml\\|xsl\\|mxml\\|rng\\|xhtml\\)\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("[^/]\\.dired$" . dired-virtual-mode))
(add-to-list 'auto-mode-alist '("\\.xtm$" . extempore-mode))


(cond ((eq window-system nil)
       ;; Running in a terminal =============
       (custom-set-faces
        '(mode-line ((t (:background "blue" :foreground "white" :weight bold))))
        '(mode-line-inactive ((default (:inherit mode-line)) (nil (:background "lightblue" :foreground "white"))))
        ))
      (t
       (set-mouse-color "black")
       (require 'server)
       (cond ((not (server-running-p))
              (server-start))
             (t "server already running"))))



(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))


(defun browse-url-chrome (url &rest args)
  (interactive (browse-url-interactive-arg "URL: "))
  (let ((browse-url-browser-function 'browse-url-generic)
        (browse-url-generic-program "google-chrome")
        (browse-url-generic-args '("--enable-user-stylesheet")))
    (apply #'browse-url url args)))

(setq browse-url-browser-function 'browse-url-chrome)


(defun browse-url-default-browser (url &rest args)
  (apply
   (cond
    ('browse-url-chrome)
    ;; ((executable-find browse-url-mozilla-program) 'browse-url-mozilla)
    (t
     (lambda (&rest ignore) (error "No usable browser found"))))
   url args))







(defun haskell-setup()
  (interactive)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
  ;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent) ; simpler indentation
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation) ; advanced indentation
  )

(haskell-setup)

(defun gnuplot-mode-setup()
  (interactive)
  (autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
  (autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
  (global-set-key [(f9)] 'gnuplot-make-buffer)
  )


(defun raise-bookmark-buffer()
  (interactive)
  (switch-to-buffer "*Bookmark List*"))

(defun flip-to-last-buffer (&optional n)
  (interactive "p")
  (switch-to-buffer (car (cdr (buffer-list)))))

(defun revert-buffer-and-refind-position()
	(interactive)
	(let ((p (point-marker)))
		(revert-buffer t t t)
		(goto-char p)))

(defun my-indent-function ()
  (interactive)
  (cond ((not mark-active)
		 (indent-according-to-mode))
		(t
		 (indent-region (point-marker) (mark-marker)))))

;;(defun find-kbd-macro-file ()
;;  (interactive)
;;  (set-buffer (find-file (concat *emacs-root* "kbd-macros.el"))))

(defun coffee-custom ()
  ;; CoffeeScript uses two spaces.
  (make-local-variable 'tab-width)
  (set 'tab-width 2)

  ;; If you don't want your compiled files to be wrapped
  ;; (setq coffee-args-compile '("-c" "--bare"))

  ;; *Messages* spam
  (setq coffee-debug-mode t)

  ;; Emacs key binding
  (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)

  ;; Compile '.coffee' files on every save
  (and (file-exists-p (buffer-file-name))
       (file-exists-p (coffee-compiled-file-name))
       (coffee-cos-mode t)))

(add-hook 'coffee-mode-hook
          '(lambda() (coffee-custom)))

(defun jade-custom ()
  (define-key jade-mode-map [(meta r)] 'coffee-compile-buffer)
  )

(add-hook 'jade-mode-hook '(lambda() (jade-custom)))
;; (remove-hook 'jade-mode-hook '(lambda() (vline-mode nil)))

;; (assorted-customizations)
;; (common-setup)

;;(defun ensime-rpc-symbol-at-point-i ()
;;  (interactive)
;;  (ensime-rpc-symbol-at-point))

(defun dired-expand-all-subdirs ()
  (interactive)
  (while
      (dired-next-dirline 1)
    (point-to-register ?q)
    (dired-maybe-insert-subdir (diredp-this-subdir)) ;; (* DIRNAME &optional SWITCHES NO-ERROR-IF-NOT-DIR-P)
    (register-to-point ?q t) ;; (* reg delete)
    ))



(setq *all-groups*
      '(("default"
         ("scala" (mode . scala-mode))
         ("java"  (mode . java-mode))
         ("dired" (mode . dired-mode))
         ("hs"    (mode . haskell-mode))
         ("markup" (or
                  (mode . nxml-mode)
                  (mode . jade-mode)
                  (mode . sws-mode)
                  (mode . less-mode)
                  (mode . markdown-mode)))
         ("js" (or
                  (mode . coffee-mode)
                  (mode . js-mode)
                  (mode . js2-mode)
                  (mode . javascript-mode)
                  (mode . javascript-ide-mode)))
         ("emacs" (mode . emacs-lisp-mode))
         ("org" (mode . org-mode))
         ("inf-*" (or
                  (mode . inf-haskell-mode)
                  (name . "^\\*ansi-term\\*$")
                  (name . "^\\*haskell\\*$")
                  ))
         ("*..*" (name . "^\\*.*\\*$"))
         )))

(setq *haskell-groups*
      '(("default"
         ("hs" (mode . haskell-mode))
         ("ghc*" (or
                  (mode . inf-haskell-mode)
                  (name . "^\\*ansi-term\\*$")
                  (name . "^\\*haskell\\*$")
                  ))
         ("dired" (mode . dired-mode))
         ("*..*" (name . "^\\*.*\\*$"))
         )))

(setq ibuffer-saved-filter-groups *all-groups*)

(add-hook 'ibuffer-mode-hook
          (lambda ()
            ;; Use human readable Size column instead of original one
            (define-ibuffer-column size-h
              (:name "Size" :inline t)
              (cond
               ((> (buffer-size) 1000) (format "%7.3fk" (/ (buffer-size) 1000.0)))
               ((> (buffer-size) 1000000) (format "%7.3fM" (/ (buffer-size) 1000000.0)))
               (t (format "%8d" (buffer-size)))))

            ;; Modify the default ibuffer-formats
            (setq ibuffer-formats
                  '((mark modified read-only " "
                          (name 35 35 :right :elide)
                          " "
                          (size-h 9 -1 :right)
                          " "
                          (mode 16 16 :left :elide)
                          " "
                          filename-and-process)))

            (ibuffer-switch-to-saved-filter-groups "default")

            ))



;; grep buffer behavior
(add-to-list 'same-window-buffer-names "*grep*")
(add-to-list 'same-window-buffer-names "*ag*")
(add-to-list 'same-window-buffer-names "*ack*")

(defun kill-grep-window ()
  (destructuring-bind (window major-mode)
      (with-selected-window (next-window (selected-window))
        (list (selected-window) major-mode))
    (when (eq major-mode 'grep-mode)
      (delete-window window))))

(add-hook 'next-error-hook 'kill-grep-window)


(defvar find-file-root-prefix (if (featurep 'xemacs) "/[sudo/root@localhost]" "/sudo:root@localhost:" )
  "*The filename prefix used to open a file with `find-file-root'.")

(defvar find-file-root-history nil
  "History list for files found using `find-file-root'.")

(defvar find-file-root-hook nil
  "Normal hook for functions to run after finding a \"root\" file.")

(defun find-file-root ()
  "*Open a file as the root user.
   Prepends `find-file-root-prefix' to the selected file name so that it
   maybe accessed via the corresponding tramp method."

  (interactive)
  (require 'tramp)
  (let* ( ;; We bind the variable `file-name-history' locally so we can
	 ;; use a separate history list for "root" files.
	 (file-name-history find-file-root-history)
	 (name (or buffer-file-name default-directory))
	 (tramp (and (tramp-tramp-file-p name)
		     (tramp-dissect-file-name name)))
	 path dir file)

    ;; If called from a "root" file, we need to fix up the path.
    (when tramp
      (setq path (tramp-file-name-localname tramp)
	    dir (file-name-directory path)))

    (when (setq file (read-file-name "Find file (UID = 0): " dir path))
      (find-file (concat find-file-root-prefix file))
      ;; If this all succeeded save our new history list.
      (setq find-file-root-history file-name-history)
      ;; allow some user customization
      (run-hooks 'find-file-root-hook))))

;; (global-set-key [(control x) (control r)] 'find-file-root)

(defface find-file-root-header-face
  '((t (:foreground "white" :background "red3")))
  "*Face use to display header-lines for files opened as root.")

(defun find-file-root-header-warning ()
  "*Display a warning in header line of the current buffer.
   This function is suitable to add to `find-file-root-hook'."
  (let* ((warning "WARNING: EDITING FILE AS ROOT!")
	 (space (+ 6 (- (window-width) (length warning))))
	 (bracket (make-string (/ space 2) ?-))
	 (warning (concat bracket warning bracket)))
    (setq header-line-format
	  (propertize  warning 'face 'find-file-root-header-face))))

(add-hook 'find-file-root-hook 'find-file-root-header-warning)

(defun delete-ansi-highlights (&optional start end)
  "Delete all the trailing whitespace across the current buffer.
   All whitespace after the last non-whitespace character in a line is deleted.
   This respects narrowing, created by \\[narrow-to-region] and friends.
   A formfeed is not considered whitespace by this function.
   If END is nil, also delete all trailing lines at the end of the buffer.
   If the region is active, only delete whitespace within the region."
  (interactive (progn
                 (barf-if-buffer-read-only)
                 (if (use-region-p)
                     (list (region-beginning) (region-end))
                   (list nil nil))))
  (save-match-data
    (save-excursion
      (let ((end-marker (copy-marker (or end (point-max))))
            (start (or start (point-min))))
        (goto-char start)
        (while (re-search-forward "\\[^m]+m" end-marker t)
          (delete-region (match-beginning 0) (match-end 0)))
        (set-marker end-marker nil))))

  (save-match-data
    (save-excursion
      (let ((end-marker (copy-marker (or end (point-max))))
            (start (or start (point-min))))
        (goto-char start)
        (while (re-search-forward "^\\[[^\]]+\\][ ]*" end-marker t)
          (delete-region (match-beginning 0) (match-end 0)))
        (set-marker end-marker nil))))
  nil)


;; (autoload 'vc-git-root "vc-git")
;; (autoload 'vc-svn-root "vc-svn")
;; (autoload 'vc-hg-root  "vc-hg")
;;
;; (defun ag/project-root (file-path)
;;   (interactive "Dag root> ")
;;   "Guess the project root of the given file path."
;;   (or (vc-git-root file-path)
;;       (vc-svn-root file-path)
;;       (vc-hg-root file-path)
;;       file-path))
;;
;;
;; (defadvice kill-new (around my-kill-new (string &optional replace yank-handler))
;;    (message "my-kill-new!"))


;;          (re-search-forward "^\[[^\]]+\][ ]*" (point-max) t)
;;          (re-search-forward "^\\[[^\]]+[ ]*[^ ]" (point-max) t)
;;
;;  (defun
;;    (while (search-forward FROM-STRING nil t)
;;      (replace-match TO-STRING nil t))
;;
;;  "[0m[[0mdebug[0m] [0mScala compilation took 25.596069243 s[0m"
;;  "[0m[[0mdebug[0m] [0mScala compilation took 25.596069243 s[0m"



(add-hook 'dired-load-hook #'(lambda nil (load "dired-x" t)))

(eval-after-load "dired-x"
  '(progn
     (defvar dired-omit-regexp-orig (symbol-function 'dired-omit-regexp))

     (defun dired-omit-regexp ()
       (let ((file (expand-file-name ".git"))
             parent-dir)
         (while (and (not (file-exists-p file))
                     (progn
                       (setq parent-dir
                             (file-name-directory
                              (directory-file-name
                               (file-name-directory file))))
                       ;; Give up if we are already at the root dir.
                       (not (string= (file-name-directory file)
                                     parent-dir))))
           ;; Move up to the parent dir and try again.
           (setq file (expand-file-name ".git" parent-dir)))
         ;; If we found a change log in a parent, use that.
         (if (file-exists-p file)
             (let ((regexp (funcall dired-omit-regexp-orig)))
               (assert (stringp regexp))
               (concat
                regexp
                (if (> (length regexp) 0)
                    "\\|" "")
                "\\("
                (mapconcat
                 #'(lambda (str)
                     (concat "^"
                             (regexp-quote
                              (substring str 13
                                         (if (= ?/ (aref str (1- (length str))))
                                             (1- (length str))
                                           nil)))
                             "$"))
                 (split-string (shell-command-to-string
                                "git clean -d -x -n")
                               "\n" t)
                 "\\|")
                "\\)"))
           (funcall dired-omit-regexp-orig))))))



;; Load these last to ensure that all of the packages we want to config
;; keys for are installed
(live-load-config-file "default-bindings.el")
(live-load-config-file "bindings.el")


;;;; eproject stuff
;;(define-project-type sbt (generic)
;;  (look-for "sbt")
;;  :relevant-files ("\\.scala$" "\\.java$" "\\.jade$" "\\.coffee$" "\\.js$" "\\.xml$" "\\.less$" "\\.conf$")
;;  :irrelevant-files ("^[.]" "^[#]" ".git/" ".hg/" "target/")
;;  )
;;
;;(define-project-type nodejs (generic)
;;  (look-for "package.json")
;;  :relevant-files ("\\.jade$" "\\.coffee$" "\\.js$" "\\.xml$" "\\.less$" "\\.conf$")
;;  :irrelevant-files ("^[.]" "^[#]" "node_modules/")
;;  )
;;
;;(setq nodejs-project-file-visit-hook
;;          (lambda ()
;;            (message "nodejs eproject")
;;            ))
;;
;;;;; ;; eproject stuff
;;;;; (define-project-type manual (generic)
;;;;;   (look-for ".eproject-root")
;;;;;   :relevant-files ("\\.scala$" "\\.java$" "\\.jade$" "\\.coffee$" "\\.js$" "\\.xml$" "\\.less$" "\\.conf$")
;;;;;   :irrelevant-files ("^[.]" "^[#]" ".git/" ".hg/" "target/")
;;;;;   )
;;
;;
;;(defun first-matching-buffer (predicate)
;;  "Return PREDICATE applied to the first buffer where PREDICATE applied to the buffer yields a non-nil value."
;;  (loop for buf in (buffer-list)
;;     when (with-current-buffer buf (funcall predicate buf))
;;     return (with-current-buffer buf (funcall predicate buf))))
;;
;;(defun fix-windows ()
;;  "Setup my window config."
;;  (interactive)
;;  (let ((current-project
;;         (first-matching-buffer (lambda (x) (ignore-errors (eproject-name)))))
;;        (current-irc-window
;;         (first-matching-buffer (lambda (x) (and (eq major-mode 'rcirc-mode)
;;                                                 x))))
;;        (current-shell
;;         (or (first-matching-buffer (lambda (x)
;;                                      (and (or (eq major-mode 'eshell-mode)
;;                                               (eq major-mode 'term-mode))
;;                                           x)))
;;             (eshell))))
;;
;;    (delete-other-windows)
;;    (split-window-horizontally)
;;    (split-window-horizontally)
;;    (window-number-select 1)
;;    (split-window-vertically)
;;    (labels ((show (x) (set-window-buffer nil (or x (get-buffer-create "*scratch*")))))
;;      (window-number-select 1)
;;      (show current-irc-window)
;;      (window-number-select 2)
;;      (show current-shell)
;;      (let ((cur))
;;        (loop for i in '(3 4)
;;              do
;;              (window-number-select i)
;;              (show (first-matching-buffer
;;                     (lambda (x) (and (equal (ignore-errors (eproject-name))
;;                                        current-project)
;;                                 (not (equal cur (buffer-name x)))
;;                                 x))))
;;              (setf cur (buffer-name (current-buffer))))))
;;    (balance-windows)))
;;
;;
;;
;;(defun setup-helm ()
;;  (helm-mode 1)
;;  )
;;(setup-helm)
;;
;;;;(disable-paredit-mode)
;;
;;(defadvice smex (around space-inserts-hyphen activate compile)
;;  (let ((ido-cannot-complete-command
;;         `(lambda ()
;;            (interactive)
;;            (if (string= " " (this-command-keys))
;;                (insert ?-)
;;              (funcall ,ido-cannot-complete-command)))))
;;    ad-do-it))
;;
;;(defun smex-update-after-load (unused)
;;  (when (boundp 'smex-cache)
;;    (smex-update)))
;;
;;(add-hook 'after-load-functions 'smex-update-after-load)
;;
;;(setq *idea* "/home/saunders/projects/the-toolshed/intellij-ideas/idea-IC-135.480/bin/idea.sh")
;;
;;(defun sync-idea-buffer ()
;;  (interactive)
;;  (let ((lineno (line-number-at-pos))
;;        (filename (buffer-file-name))
;; (shell-command (concat *idea* (" --line " number-to-string lineno) " " filename))
