;; TODO TAB-switching buffers should not switch to non-intersting buffers (*xx*, help buffers, etc)
;; TODO make space-l (or something) act like escape
;;
(message "loading adamchandra/packages.el")

;; (require 'package)
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)


(defvar adamchandra-packages
  '(
    ag
    ample-regexps
    auto-save-buffers-enhanced
    ;; deft
    ;; ensime
    facemenu+
    faces+
    ;; ggtags
    git-gutter+
    git-gutter-fringe
    helm-c-yasnippet
    ;; helm-gtags
    haskell-mode
    lively
    ;; magit
    magit-filenotify   ;; Refresh status buffer when git tree changes
    ;; org-plus-contrib
    pdf-tools
    ;; scala-mode2
    ;; smex
    wgrep
    wgrep-ack
    wgrep-ag
    wgrep-helm
    yaml-mode
    yasnippet
    ztree
    ;; gh-md
    ;; markdown-mode
    markdown-mode+
    )
  "List of all packages to install and/or initialize. Built-in packages which require an initialization must be listed explicitly in the list."
  )


(defvar adamchandra-excluded-packages
  '(
    ;; org
    org-bullets
    paradox
    )
  "List of packages to exclude."
  )


;; (defun adamchandra/init-XXX            () "init XXX"               (use-package XXX            :defer t))
;; (defun adamchandra/init-org            () "init org"               (use-package org            :defer t))

(defun adamchandra/init-ag                () "init ag"                (use-package ag            :defer t))
(defun adamchandra/init-ample-regexps     () "ample re init"          (use-package ample-regexps     :defer t))
;; auto-save-buffers-enhanced
;; deft
;; ensime
(defun adamchandra/init-facemenu+         () "facemenu+ init"         (use-package facemenu+         :defer t))
(defun adamchandra/init-faces+            () "faces+ init"            (use-package faces+            :defer t))
(defun adamchandra/init-ggtags            () "ggtags init"            (use-package ggtags            :defer t))
(defun adamchandra/init-git-gutter+       () "init git-gutter+"       (use-package git-gutter+       :defer t))
(defun adamchandra/init-git-gutter-fringe () "init git-gutter-fringe" (use-package git-gutter-fringe :defer t))
(defun adamchandra/init-haskell-mode      () "init haskell mode"      (use-package haskell-mode      :defer t))
(defun adamchandra/init-lively            () "init lively"            (use-package lively            :defer t))
(defun adamchandra/init-helm-gtags        () "init helm-gtags"        (use-package helm-gtags        :defer t))
(defun adamchandra/init-helm-c-yasnippet  () "init helm-c-yasnippet"  (use-package helm-c-yasnippet  :defer t))
;; (defun adamchandra/init-magit             () "init magit"             (use-package magit             :defer t))
(defun adamchandra/init-magit-filenotify  () "init magit-filenotify"  (use-package magit-filenotify  :defer t))
;; org-plus-contrib
;; scala-mode2
;; (defun adamchandra/init-smex              () "init smex"              (use-package smex              :defer t))
(defun adamchandra/init-wgrep             () "init wgrep"             (use-package wgrep             :defer t))
(defun adamchandra/init-pdf-tools         () "init pdf-tools"         (use-package pdf-tools         :defer t))
(defun adamchandra/init-wgrep-ack         () "init wgrep-ack"         (use-package wgrep-ack         :defer t))
(defun adamchandra/init-wgrep-ag          () "init wgrep-ag"          (use-package wgrep-ag          :defer t))
(defun adamchandra/init-wgrep-helm        () "init wgrep-helm"        (use-package wgrep-helm        :defer t))
(defun adamchandra/init-yaml-mode         () "init yaml"              (use-package yaml-mode         :defer t))
(defun adamchandra/init-ztree             () "init ztree"             (use-package ztree             :defer t))

;; (defun adamchandra/init-gh-md             () "init gh-md"             (use-package gh-md                  :defer t))
(defun adamchandra/init-markdown-mode     () "init markdown"          (use-package markdown-mode          :defer t))
(defun adamchandra/init-markdown-mode+    () "init markdown+"         (use-package markdown-mode+         :defer t))


;; ;;       `yas-snippet-dirs'
;; (defun adamchandra/init-org-plus-contrib ()
;;   "Initialize Org mode"
;;   (use-package org
;;     :defer t
;;     :init
;;     ;; Set to the name of the file where new notes will be stored
;;     (setq org-mobile-inbox-for-pull "~/org/org-mobile-inbox.org")
;;     ;; ;; Set to <your Dropbox root directory>/MobileOrg.
;;     (setq org-mobile-directory "~/Dropbox/MobileOrg")
;;     )
;;   )



(defun adamchandra/init-yasnippet ()
  (interactive)
  (use-package yasnippet
    :init
    (progn)
    :config
    (progn
      (let* ((dir (configuration-layer/get-layer-path 'adamchandra))
             (yas-dir (concat dir "my-snippets")))
        (add-to-list 'yas-snippet-dirs yas-dir))
      (yas-global-mode 1)
      (spacemacs|diminish yas-minor-mode " Ⓨ")
      (setq helm-c-yas-space-match-any-greedy t)
      (evil-leader/set-key "y" ())
      (evil-leader/set-key
        "yy" 'helm-yas-complete
        "yc" 'helm-yas-create-snippet-on-region
        )
      )
  ))




(defun adamchandra/init-auto-save-buffers-enhanced ()
  (use-package auto-save-buffers-enhanced
    :config (progn
              (auto-save-buffers-enhanced t)
              (auto-save-buffers-enhanced-include-only-checkout-path t)
              (setq auto-save-buffers-enhanced-interval 3) ;; seconds
              ;; (setq auto-save-buffers-enhanced-include-regexps '(".+"))
              ;; (setq auto-save-buffers-enhanced-exclude-regexps '("^not-save-file" "\\.ignore$"))
              )))


(defun adamchandra/init-aggressive-indent ()
  (use-package aggressive-indent
    :defer t
    :init
    (add-to-hooks #'aggressive-indent-mode '(emacs-lisp-mode-hook
                                             racket-mode-hook
                                             css-mode-hook))
    :config
    (spacemacs|hide-lighter aggressive-indent-mode)))



(defun adamchandra/init-scala-mode ()
  (use-package scala-mode
    :defer t
    :init
    (progn
      (message "running :init adamchandra/init-lang-scala-mode")
      (dolist (ext '(".cfe" ".cfs" ".si" ".gen" ".lock"))
        (add-to-list 'completion-ignored-extensions ext))
      )

    :config
    (progn
      (message "running :config adamchandra/scala-mode")

      (setq
       scala-indent:step 2
       scala-indent:indent-value-expression nil
       scala-indent:align-parameters nil
       scala-indent:align-forms nil

       ;; (defconst scala-indent:eager-strategy 0
       ;; (defconst scala-indent:operator-strategy 1
       ;; (defconst scala-indent:reluctant-strategy 2
       scala-indent:default-run-on-strategy scala-indent:operator-strategy

       scala-indent:add-space-for-scaladoc-asterisk t
       scala-indent:use-javadoc-style nil)
      )
    ))

(setq ensime-startup-snapshot-notification ())
