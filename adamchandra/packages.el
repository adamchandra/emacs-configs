;;;;;;;;;;;;;;;;;;;;;;;
;;
(message "loading adamchandra/packages.el")

;; (require 'package)
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)


(defvar adamchandra-packages
  '(
    ag
    ample-regexps
    auto-save-buffers-enhanced

    flycheck
    helm-flycheck
    elmacro

    facemenu+
    faces+
    helm-c-yasnippet
    ;; helm-gtags
    haskell-mode
    lively
    ;; magit
    magit-filenotify   ;; Refresh status buffer when git tree changes
    nlinum
    ;; nlinum-relative
    ;; org-plus-contrib
    pdf-tools
    indy
    sws-mode
    tern-auto-complete
    wgrep
    wgrep-ack
    wgrep-ag
    wgrep-helm
    yaml-mode
    yasnippet
    ztree
    markdown-mode+
    ;; emacsql-psql

    org-noter
    interleave
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
(defun adamchandra/init-indy()
  "init indy"
  (use-package indy
    :defer t
    :ensure t
    :init
    (setq indy-rules
          '(
            (erlang-mode . (
                            ((indy--prev 'indy--ends-on "->" "fun" "of" "begin") (indy--prev-tab 1))
                            ((indy--prev 'indy--ends-on ";") (indy--prev-tab -1))
                            ((and (indy--prev 'indy--ends-on "end") (indy--current 'indy--starts-with "end")) (indy--prev-tab -1))
                            ((indy--current 'indy--ends-on "end") (indy--prev-tab -1))
                            ((and (indy--prev 'indy--ends-on "[") (indy--current 'indy--starts-with "]")) (indy--prev-tab))
                            ((and (indy--prev 'indy--ends-on "{") (indy--current 'indy--starts-with "}")) (indy--prev-tab))
                            ((and (indy--prev 'indy--ends-on "(") (indy--current 'indy--starts-with ")")) (indy--prev-tab))
                            ((indy--current 'indy--starts-with "]" "}" ")") (indy--prev-tab -1))
                            ((indy--prev 'indy--ends-on "[" "{" "(") (indy--prev-tab 1))
                            ((indy--prev 'indy--ends-on ",") (indy--prev-tab))))
            (js2-mode . ())
            )
          )
    :config
    (add-hook 'erlang-mode-hook 'indy-mode)
    (add-hook 'js2-mode-hook 'indy-mode)
    )
  )



(defun adamchandra/init-interleave           () "init interleave"             (use-package interleave           :defer t))
(defun adamchandra/init-org-noter            () "init org-noter"              (use-package org-noter            :defer t))

;; (defun adamchandra/init-emacsql-psql            () "init emacsql-psql"              (use-package emacsql-psql            :defer t))

(defun adamchandra/init-tern-auto-complete            () "init tern-auto-complete"               (use-package tern-auto-complete            :defer t))
(defun adamchandra/init-helm-flycheck       () "init helm-flycheck"         (use-package helm-flycheck       :defer t))
(defun adamchandra/init-flycheck            () "init flycheck"              (use-package flycheck            :defer t))
(defun adamchandra/init-ag                () "init ag"                (use-package ag                :defer t))
(defun adamchandra/init-elmacro                () "init elmacro"                (use-package elmacro                :defer t))
(defun adamchandra/init-ample-regexps     () "ample re init"          (use-package ample-regexps     :defer t))
(defun adamchandra/init-facemenu+         () "facemenu+ init"         (use-package facemenu+         :defer t))
(defun adamchandra/init-faces+            () "faces+ init"            (use-package faces+            :defer t))
(defun adamchandra/init-ggtags            () "ggtags init"            (use-package ggtags            :defer t))
(defun adamchandra/init-haskell-mode      () "init haskell mode"      (use-package haskell-mode      :defer t))
(defun adamchandra/init-lively            () "init lively"            (use-package lively            :defer t))
(defun adamchandra/init-nlinum            () "init nlinum"            (use-package nlinum            :defer t))
(defun adamchandra/init-helm-gtags        () "init helm-gtags"        (use-package helm-gtags        :defer t))
(defun adamchandra/init-helm-c-yasnippet  () "init helm-c-yasnippet"  (use-package helm-c-yasnippet  :defer t))
(defun adamchandra/init-magit-filenotify  () "init magit-filenotify"  (use-package magit-filenotify  :defer t))
(defun adamchandra/init-sws-mode               () "init sws-mode"               (use-package sws-mode               :defer t))
(defun adamchandra/init-wgrep             () "init wgrep"             (use-package wgrep             :defer t))
(defun adamchandra/init-pdf-tools         () "init pdf-tools"         (use-package pdf-tools         :defer t))
(defun adamchandra/init-wgrep-ack         () "init wgrep-ack"         (use-package wgrep-ack         :defer t))
(defun adamchandra/init-wgrep-ag          () "init wgrep-ag"          (use-package wgrep-ag          :defer t))
(defun adamchandra/init-wgrep-helm        () "init wgrep-helm"        (use-package wgrep-helm        :defer t))
(defun adamchandra/init-yaml-mode         () "init yaml"              (use-package yaml-mode         :defer t))
(defun adamchandra/init-ztree             () "init ztree"             (use-package ztree             :defer t))
(defun adamchandra/init-markdown-mode     () "init markdown"          (use-package markdown-mode          :defer t))
(defun adamchandra/init-markdown-mode+    () "init markdown+"         (use-package markdown-mode+         :defer t))



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
              (auto-save-buffers-enhanced-include-only-checkout-path nil)
              (setq auto-save-buffers-enhanced-interval 0.5) ;; seconds
              (setq auto-save-buffers-enhanced-quiet-save-p t)
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
