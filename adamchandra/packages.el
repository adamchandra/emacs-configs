;; TODO TAB-switching buffers should not switch to non-intersting buffers (*xx*, help buffers, etc)
;; TODO make space-l (or something) act like escape
;;
(message "loading adamchandra/packages.el")

;; (require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)


(defvar adamchandra-packages
  '(
    ag
    ample-regexps
    auto-save-buffers-enhanced
    deft
    ;; ensime
    facemenu+
    faces+
    git-gutter+
    git-gutter-fringe
    helm-c-yasnippet
    haskell-mode
    lively
    magit
    magit-filenotify   ;; Refresh status buffer when git tree changes
    org-plus-contrib
    ;; scala-mode2
    ;; smex
    wgrep
    wgrep-ack
    wgrep-ag
    wgrep-helm
    yaml-mode
    yasnippet
    ztree
    gh-md
    markdown-mode
    markdown-mode+
    )
  "List of all packages to install and/or initialize. Built-in packages which require an initialization must be listed explicitly in the list."
  )


(defvar adamchandra-excluded-packages
  '(org
    org-bullets
    paradox
    )
  "List of packages to exclude."
  )


;; ag
(defun adamchandra/init-ample-regexps     () "ample re init"          (use-package ample-regexps     :defer t))
;; auto-save-buffers-enhanced
;; deft
;; ensime
(defun adamchandra/init-facemenu+         () "facemenu+ init"         (use-package facemenu+         :defer t))
(defun adamchandra/init-faces+            () "faces+ init"            (use-package facemenu+         :defer t))
(defun adamchandra/init-git-gutter+       () "init git-gutter+"       (use-package git-gutter+       :defer t))
(defun adamchandra/init-git-gutter-fringe () "init git-gutter-fringe" (use-package git-gutter-fringe :defer t))
(defun adamchandra/init-haskell-mode      () "init haskell mode"      (use-package haskell-mode      :defer t))
(defun adamchandra/init-lively            () "init lively"            (use-package lively            :defer t))
(defun adamchandra/init-helm-c-yasnippet  () "init helm-c-yasnippet"  (use-package helm-c-yasnippet  :defer t))
(defun adamchandra/init-magit             () "init magit"             (use-package magit             :defer t))
(defun adamchandra/init-magit-filenotify  () "init magit-filenotify"  (use-package magit-filenotify  :defer t))
;; org-plus-contrib
;; scala-mode2
;; (defun adamchandra/init-smex              () "init smex"              (use-package smex              :defer t))
(defun adamchandra/init-wgrep             () "init wgrep"             (use-package wgrep             :defer t))
(defun adamchandra/init-wgrep-ack         () "init wgrep-ack"         (use-package wgrep-ack         :defer t))
(defun adamchandra/init-wgrep-ag          () "init wgrep-ag"          (use-package wgrep-ag          :defer t))
(defun adamchandra/init-wgrep-helm        () "init wgrep-helm"        (use-package wgrep-helm        :defer t))
(defun adamchandra/init-yaml-mode         () "init yaml"              (use-package yaml-mode         :defer t))
(defun adamchandra/init-ztree             () "init ztree"             (use-package ztree             :defer t))

(defun adamchandra/init-gh-md             () "init gh-md"             (use-package gh-md             :defer t))
(defun adamchandra/init-markdown-mode     () "init markdown"          (use-package markdown-mode          :defer t))
(defun adamchandra/init-markdown-mode+    () "init markdown+"         (use-package markdown-mode+         :defer t))


;;       `yas-snippet-dirs'
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



;; (defun spacemacs/load-yasnippet ()
;;   (if (not (boundp 'yas-minor-mode))
;;       (progn
;;         (let* ((dir (config-system/get-layer-property 'adamchandra :dir))
;;                (yas-dir (list (concat dir "my-snippets"))))
;;           (setq yas-snippet-dirs yas-dir)
;;           (yas-global-mode 1)))))

(defun adamchandra/init-yasnippet ()
 (interactive)
  (use-package yasnippet
    :init
    (progn)
    :config
    (progn
            (let* ((dir (configuration-layer/get-layer-property 'adamchandra :dir))
                   (my-yas-dir (concat dir "my-snippets")))
              (setq yas-snippet-dirs (cons my-yas-dir yas-snippet-dirs))
              (yas-global-mode 1))
      ;; (add-to-hooks 'spacemacs/load-yasnippet '(prog-mode-hook
      ;;                                           org-mode-hook))
      (spacemacs|diminish yas-minor-mode " Ⓨ")
      (setq helm-c-yas-space-match-any-greedy t)
      (evil-leader/set-key "y" ())
      (evil-leader/set-key
        "yy" 'helm-yas-complete
        "yc" 'helm-yas-create-snippet-on-region
        )
      )
    ))


;; (defun adamchandra/init-auto-save-buffers-enhanced ()
;;   (require 'auto-save-buffers-enhanced)
;;   (auto-save-buffers-enhanced t)

(defun adamchandra/init-auto-save-buffers-enhanced ()
  (use-package auto-save-buffers-enhanced
    :defer t
    :init
    (progn
      (auto-save-buffers-enhanced t)
      (auto-save-buffers-enhanced-include-only-checkout-path t)
      (setq auto-save-buffers-enhanced-interval 5) ;; seconds
      ;; (setq auto-save-buffers-enhanced-include-regexps '(".+"))
      ;; (setq auto-save-buffers-enhanced-exclude-regexps '("^not-save-file" "\\.ignore$"))
      )
    ))



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




(defun adamchandra/init-aggressive-indent ()
  (use-package aggressive-indent
    :defer t
    :init
    (add-to-hooks #'aggressive-indent-mode '(emacs-lisp-mode-hook
                                             racket-mode-hook
                                             css-mode-hook))
    :config
    (spacemacs|hide-lighter aggressive-indent-mode)))



;; (defun adamchandra/init-ensime ()
;;   (use-package ensime
;;     :commands (ensime-mode)
;;     :init

;;     (progn
;;       (message " init'ing ensime")
;;       (add-hook 'scala-mode-hook 'scala/configure-flyspell)
;;       (add-hook 'scala-mode-hook 'scala/configure-ensime))

;;     :config
;;     (progn
;;       (message " config'ing ensime")
;;       (init-ensime-keybindings)
;;       (evil-define-key 'insert ensime-mode-map (kbd ".") 'scala/completing-dot)

;;       (evil-define-key 'normal ensime-popup-buffer-map
;;         (kbd "q") 'ensime-popup-buffer-quit-function)

;;       (evil-define-key 'normal ensime-refactor-info-map
;;         (kbd "q") 'spacemacs/ensime-refactor-cancel
;;         (kbd "c") 'spacemacs/ensime-refactor-accept
;;         (kbd "RET") 'spacemacs/ensime-refactor-accept)

;;       (evil-define-key 'normal ensime-compile-result-map
;;         (kbd "g") 'ensime-show-all-errors-and-warnings
;;         (kbd "TAB") 'forward-button
;;         (kbd "<backtab>") 'backward-button
;;         (kbd "M-n") 'forward-button
;;         (kbd "M-p") 'backward-button
;;         (kbd "n") 'forward-button
;;         (kbd "N") 'backward-button)

;;       ;; Don't use scala checker if ensime mode is active, since it provides
;;       ;; better error checking.
;;       (eval-after-load 'flycheck
;;         '(progn
;;            (defun scala/disable-flycheck () (flycheck-mode -1))
;;            (add-hook 'ensime-mode-hook 'scala/disable-flycheck))))))

;; (defun adamchandra/init-scala-mode2 ()
;;   (use-package scala-mode2
;;     :defer t
;;     :init
;;     (dolist (ext '(".cfe" ".cfs" ".si" ".gen" ".lock"))
;;       (add-to-list 'completion-ignored-extensions ext))
;;     :config
;;     (progn
;;       (evil-define-key 'normal scala-mode-map "J" 'spacemacs/scala-join-line)

;;       ;; Compatibility with `aggressive-indent'
;;       (custom-set-variables
;;        '(scala-indent:default-run-on-strategy scala-indent:operator-strategy)
;;        '(scala-indent:step 2)
;;        '(scala-indent:indent-value-expression nil)
;;        '(scala-indent:align-parameters nil)
;;        '(scala-indent:align-forms nil)
;;        '(scala-indent:add-space-for-scaladoc-asterisk t)
;;        '(scala-indent:use-javadoc-style nil)
;;        )

;;       ;; (defadvice scala-indent:indent-code-line (around retain-trailing-ws activate)
;;       ;;   "Keep trailing-whitespace when indenting."
;;       ;;   (noflet ((scala-lib:delete-trailing-whitespace ()))
;;       ;;           ad-do-it))

;;       )))



;; (setq helm-display-header-line nil) ;; t by default
;; (helm-autoresize-mode 1)
;; (setq helm-split-window-in-side-p t)

;; (set-face-attribute 'helm-source-header nil :height 0.1)
;; (setq helm-autoresize-max-height 30)
;; (setq helm-autoresize-min-height 30)
;; (setq max-specpdl-size 100)  ; default is 1000, reduce the backtrace level
;; (setq debug-on-error nil)
