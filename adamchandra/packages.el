;; TODO TAB-switching buffers should not switch to non-intersting buffers (*xx*, help buffers, etc)
;; TODO make space-l (or something) act like escape
;;
(message "loading adamchandra/packages.el")

;; (require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(defvar adamchandra-packages
  '(deft
    helm-ag
    yaml-mode
    ag
    auto-save-buffers-enhanced
    git-gutter+
    git-gutter-fringe
    scala-mode2
    ensime
    magit
    org-plus-contrib
    facemenu+
    faces+
    ;;  auto-complete-mode
    ;; magit-annex        ;; Use git annex within magit
    ;; magit-filenotify   ;; Refresh status buffer when git tree changes
    ;; magit-find-file    ;; completing-read over all files in Git
    ;; magit-gerrit       ;; Magit plugin for Gerrit Code Review
    ;; magit-gh-pulls     ;; GitHub pull requests extension for Magit :
    ;; magit-gitflow      ;; gitflow extension for magit
    ;; magit-log-edit     ;; [SEMI-OBSOLETE] major mode for editing Git commit messages
    ;; magit-push-remote  ;; push remote support for Magit
    ; magit-simple-keys  ;; simple keybindings for Magit
    ;; magit-stgit        ;; StGit plug-in for Magit
    ;; magit-svn          ;; git-svn plug-in for Magit
    ;; magit-topgit       ;; topgit plug-in for Magit
    ;; magit-tramp        ;; git method for TRAMP
    ;; yasnippet
    ;; evil-args
    ;; evil-commentary
    ;; evil-easymotion
    ;; evil-escape
    ;; evil-exchange
    ;; evil-god-state
    ;; evil-iedit-state
    ;; evil-indent-textobject
    ;; evil-jumper
    ;; evil-leader
    ;; evil-lisp-state
    ;; evil-matchit
    ;; evil-nerd-commenter
    ;; evil-numbers
    ;; evil-org
    ;; evil-paredit
    ;; evil-search-highlight-persist
    evil-snipe
    ;; evil-space
    ;; evil-surround
    wgrep
    )
  "List of all packages to install and/or initialize. Built-in packages which require an initialization must be listed explicitly in the list."
  )


(defvar adamchandra-excluded-packages
  '(
    org-bullets
    org
    ;; yasnippet
    paradox
    )
  "List of packages to exclude."
  )

(defun adamchandra/init-wgrep ()
  "init wgrep"
  (use-package wgrep
    :defer t
  ))

(defun adamchandra/init-faces+ ()
  "faces+ init"
  (use-package facemenu+
    :defer t
    :init
    )
  )

(defun adamchandra/init-facemenu+ ()
  "facemenu+ init"
  (use-package facemenu+
    :defer t
    :init
    )
  )

(defun adamchandra/init-org-plus-contrib ()
  "Initialize Org mode"
  (use-package org
    :defer t
    :init
    ;; Set to the name of the file where new notes will be stored
    (setq org-mobile-inbox-for-pull "~/org/org-mobile-inbox.org")
    ;; ;; Set to <your Dropbox root directory>/MobileOrg.
    (setq org-mobile-directory "~/Dropbox/MobileOrg")
    )
  )


(defun adamchandra/init-deft ()
  "Initialize deft"
  (use-package deft
    :defer t
    :init
    (evil-leader/set-key
      "fo" 'deft
      )
    (setq deft-directory (expand-file-name "~/projects/the-toolshed/emacsen/org-files/emacs-deft/")))

  (setq deft-extension "org")
  (setq deft-text-mode 'org-mode)
  )

;; change the default snippet dir for yasnippet
;; (setq yas-snippet-dirs '("~/projects/the-toolshed/emacsen/emacs-configs/my-snippets" "/home/saunders/.emacs.d/spacemacs/extensions/yasnippet-snippets"))

(if (boundp 'yas-snippet-dirs)
    (progn
      (message "bound")
      (setq yas-snippet-dirs (cons "~/projects/the-toolshed/emacsen/emacs-configs/my-snippets" yas-snippet-dirs)))
  (progn
    (setq yas-snippet-dirs '("~/projects/the-toolshed/emacsen/emacs-configs/my-snippets" ))))


;;(defun adamchandra/init-yasnippet ()
;;  (interactive)
  ;; (message "initing yasnippet (adamchandra)")
  ;; (use-package yasnippet
  ;;   :commands yas-global-mode
  ;;   :init
  ;;   (progn
  ;;     (defun spacemacs/load-yasnippet ()
  ;;       (if (not (boundp 'yas-minor-mode))
  ;;           (progn
  ;;             (let* ((dir (config-system/get-layer-property 'adamchandra :dir))
  ;;                    (yas-dir (list (concat dir "my-snippets"))))
  ;;               (setq yas-snippet-dirs yas-dir)
  ;;               (yas-global-mode 1)))))
  ;;     (add-to-hooks 'spacemacs/load-yasnippet '(prog-mode-hook
  ;;                                               org-mode-hook)))
  ;;   :config
  ;;   (progn
  ;;     (spacemacs|diminish yas-minor-mode " Ⓨ")
  ;;     (require 'helm-c-yasnippet)
  ;;     (evil-leader/set-key "is" 'helm-yas-complete)
  ;;     (setq helm-c-yas-space-match-any-greedy t))))

;;(adamchandra/init-yasnippet)

(defun adamchandra/init-auto-save-buffers-enhanced ()
  (require 'auto-save-buffers-enhanced)
  (auto-save-buffers-enhanced t)

  ;;
  ;; (setq auto-save-buffers-enhanced-include-regexps '(".+"))
  ;; (setq auto-save-buffers-enhanced-exclude-regexps '("^not-save-file" "\\.ignore$"))
  ;;
  ;; If you want `auto-save-buffers-enhanced' to work only with the files under
  ;;
  ;;   ;; If you're using CVS or Subversion or git
  ;;   (auto-save-buffers-enhanced-include-only-checkout-path t)
  ;;   (auto-save-buffers-enhanced t)
  ;;
  ;;   (global-set-key "\C-xas" 'auto-save-buffers-enhanced-toggle-activity)
  )
(defun init-ensime-keybindings ()
  (evil-leader/set-key "e" nil)

  (mapc (lambda (x) (spacemacs/declare-prefix (car x) (cdr x)))
        '(("e" .  "ensime/compile")
          ("er" .  "refactor/format")
          ("ec" .  "compile")
          ("et" .  "test")
          ("eg" .  "goto")
          ("ei" .  "inspect type/pack")
          ("ee" .  "navigate err/warn")
          ("es" .  "srch/show/doc/usage")))


  (evil-leader/set-key-for-mode 'scala-mode
    "eit" 'ensime-inspect-type-at-point           ;; "C-v i"
    "eip" 'ensime-inspect-package-at-point        ;; "C-v p"
                                        ;o;"ei" 'ensime-inspect-project-package         ;; "C-v o"
      ;;;;;;
    "ess" 'ensime-show-uses-of-symbol-at-point    ;; "C-v r"
    "esa" 'ensime-search                          ;; "C-v v"
    "esx" 'ensime-scalex                          ;; "C-v x"
    "esd" 'ensime-show-doc-for-symbol-at-point    ;; "C-v d"
    "ecf" 'ensime-typecheck-current-file          ;; "C-c c"
    "eca" 'ensime-typecheck-all                   ;; "c-c a"
      ;;;;;;;;;
    "egf" 'ensime-reload-open-files               ;; "C-c r"
      ;;;;;;;;;
    "err" 'ensime-refactor-rename                 ;; "C-r r"
    "ero" 'ensime-refactor-organize-imports       ;; "C-r o"
    "erl" 'ensime-refactor-extract-local          ;; "C-r l"
    "erm" 'ensime-refactor-extract-method         ;; "C-r m"
    "erf" 'ensime-format-source
    "eri" 'ensime-import-type-at-point            ;; "C-r t"
      ;;;;;;;;;;;;;;;;
    "e." 'ensime-edit-definition                 ;; "M-."
    "e," 'ensime-pop-find-definition-stack       ;; "M-,"
    ;;
    "eea" 'ensime-show-all-errors-and-warnings    ;; "C-c e"
    "een" 'ensime-forward-note                    ;; "M-n"
    "eep" 'ensime-backward-note                   ;; "M-p"
    "eee" 'ensime-compile-errors                   ;; "M-p"
      ;;;;;;;;;;;
    "egt" 'ensime-goto-test                        ;; "M-p"
    "egi" 'ensime-goto-impl                        ;; "M-p"

    "ett" 'ensime-sbt-do-test                ;; "c-c a"
    "eto" 'ensime-sbt-do-test-only                ;; "c-c a"
    "etq" 'ensime-sbt-do-test-quick                ;; "c-c a"
    )
  )


;; (add-hook 'scala-mode-hook 'init-ensime-keybindings)

;; (defun adamchandra/init-ensime ()
;;   (interactive)
;;   "Initialize ensime"
;;   (use-package ensime
;;     :defer t
;;     :config
;;     (message "ensime mode loaded")

;;     :init
;;     (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;;     )
;;   )

;;"e" 'ensime-sbt-switch                      ;; "C-v s"
;;"e" 'ensime-inf-switch                      ;; "C-v z"
;;"e" 'ensime-undo-peek                       ;; "C-v u"
;;"e" 'ensime-print-type-at-point             ;; "C-v t"
;;"e" 'ensime-print-errors-at-point           ;; "C-v e"
;; "e" 'ensime-expand-selection-command        ;; "C-v ."
;; "e" 'ensime-inf-eval-region               "C;; -v C-r"
;; "e" 'ensime-inf-eval-buffer                 ;; "C-v b"
;; "e" 'ensime-inf-load-file                   ;; "C-v l"
;; "e" 'ensime-db-start                        ;; "C-d d"
;; "e" 'ensime-db-set-break                    ;; "C-d b"
;; "e" 'ensime-db-clear-break                  ;; "C-d u"
;; "e" 'ensime-db-step                         ;; "C-d s"
;; "e" 'ensime-db-step-out                     ;; "C-d o"
;; "e" 'ensime-db-next                         ;; "C-d n"
;; "e" 'ensime-db-run                          ;; "C-d r"
;; "e" 'ensime-db-continue                     ;; "C-d c"
;; "e" 'ensime-db-quit                         ;; "C-d q"
;; "e" 'ensime-db-inspect-value-at-point       ;; "C-d i"
;; "e" 'ensime-db-backtrace                    ;; "C-d t"
;; "e" 'ensime-db-clear-all-breaks             ;; "C-d a"
;; "e" 'ensime-sbt-switch                      ;; "C-b s"
;; "e" 'ensime-stacktrace-switch               ;; "C-b S"
;; "e" 'ensime-sbt-do-compile                  ;; "C-b c"
;; "e" 'ensime-sbt-do-clean                    ;; "C-b n"
;; "e" 'ensime-sbt-do-package                  ;; "C-b p"
;; "e" 'ensime-sbt-do-run                      ;; "C-b r"
;; "e" 'ensime-sbt-do-test                     ;; "C-b T"
;; "e" 'ensime-sbt-do-test-quick               ;; "C-b t"
;; "e" 'ensime-db-clear-break                  ;; "C-d u"
;; "e" 'ensime-db-step                         ;; "C-d s"
;; "e" 'ensime-db-next                         ;; "C-d n"
;; "e" 'ensime-db-run                          ;; "C-d r"
;; "e" 'ensime-db-continue                     ;; "C-d c"
;; "e" 'ensime-db-quit                         ;; "C-d q"
;; "e" 'ensime-db-list-locals                  ;; "C-d l"
;; For each package, define a function adamchandra/init-<package-adamchandra>
;;
;; (defun adamchandra/init-my-package ()
;;   "Initialize my package"
;;   )



;; (defun adamchandra/init-helm-ag ()
;;   (use-package helm-ag
;;     :init
;;     (progn
;;       (defun adamchandra-helm-ag ()
;;         (interactive)
;;         (helm-ag (projectile-project-root)))
;;       (evil-leader/set-key
;;         "oa" 'adamchandra-helm-ag))))

(defun adamchandra/init-yaml-mode ()
  (use-package yaml-mode
    :defer t))



(defun adamchandra/init-aggressive-indent ()
  (use-package aggressive-indent
    :defer t
    :init
    (add-to-hooks #'aggressive-indent-mode '(emacs-lisp-mode-hook
                                             racket-mode-hook
                                             css-mode-hook))
    :config
    (spacemacs|hide-lighter aggressive-indent-mode)))

;; (defun adamchandra/init-hungry-delete ()
;;   (use-package hungry-delete
;;     :init (global-hungry-delete-mode)
;;     :config
;;     (progn
;;       (setq-default hungry-delete-chars-to-skip " \t\f\v") ; only horizontal whitespace
;;       (define-key hungry-delete-mode-map (kbd "DEL") 'hungry-delete-backward)
;;       (define-key hungry-delete-mode-map (kbd "S-DEL") 'delete-backward-char))))



;; From adams
;; (when (>= emacs-major-version 24)
;;   (require 'package)
;;   (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
;;   (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)


;; From spacemacs:
;;     (setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
;;                              ("gnu" . "http://elpa.gnu.org/packages/")
;;                              ("melpa" . "http://melpa.org/packages/")))
;;                    '("marmalade" . "http://marmalade-repo.org/packages/")))

(defun adamchandra/init-ensime ()
  (use-package ensime
    :commands (ensime-mode)
    :init
    (progn
      (add-hook 'scala-mode-hook 'scala/configure-flyspell)
      (add-hook 'scala-mode-hook 'scala/configure-ensime))
    :config
    (progn
      (init-ensime-keybindings)
      (evil-define-key 'insert ensime-mode-map (kbd ".") 'scala/completing-dot)

      (evil-define-key 'normal ensime-popup-buffer-map
        (kbd "q") 'ensime-popup-buffer-quit-function)

      (evil-define-key 'normal ensime-refactor-info-map
        (kbd "q") 'spacemacs/ensime-refactor-cancel
        (kbd "c") 'spacemacs/ensime-refactor-accept
        (kbd "RET") 'spacemacs/ensime-refactor-accept)

      (evil-define-key 'normal ensime-compile-result-map
        (kbd "g") 'ensime-show-all-errors-and-warnings
        (kbd "TAB") 'forward-button
        (kbd "<backtab>") 'backward-button
        (kbd "M-n") 'forward-button
        (kbd "M-p") 'backward-button
        (kbd "n") 'forward-button
        (kbd "N") 'backward-button)

      ;; Don't use scala checker if ensime mode is active, since it provides
      ;; better error checking.
      (eval-after-load 'flycheck
        '(progn
           (defun scala/disable-flycheck () (flycheck-mode -1))
           (add-hook 'ensime-mode-hook 'scala/disable-flycheck))))))

(defun adamchandra/init-scala-mode2 ()
  (use-package scala-mode2
    :defer t
    :init
    (dolist (ext '(".cfe" ".cfs" ".si" ".gen" ".lock"))
      (add-to-list 'completion-ignored-extensions ext))
    :config
    (progn
      (evil-define-key 'normal scala-mode-map "J" 'spacemacs/scala-join-line)

      ;; Compatibility with `aggressive-indent'
      (custom-set-variables
       '(scala-indent:default-run-on-strategy scala-indent:operator-strategy)
       '(scala-indent:step 2)
       '(scala-indent:indent-value-expression nil)
       '(scala-indent:align-parameters nil)
       '(scala-indent:align-forms nil)
       '(scala-indent:add-space-for-scaladoc-asterisk t)
       '(scala-indent:use-javadoc-style nil)
       )

      ;; (defadvice scala-indent:indent-code-line (around retain-trailing-ws activate)
      ;;   "Keep trailing-whitespace when indenting."
      ;;   (noflet ((scala-lib:delete-trailing-whitespace ()))
      ;;           ad-do-it))

      )))
