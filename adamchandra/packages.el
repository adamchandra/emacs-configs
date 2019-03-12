;;;;;;;;;;;;;;;;;;;;;;;
;;
(message "loading adamchandra/packages.el")

;; (require 'package)
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)


(defvar adamchandra-packages
  '(
    add-node-modules-path
    ag
    ;; ample-regexps
    auto-save-buffers-enhanced

    flycheck
    helm-flycheck
    elmacro

    ;; facemenu+
    ;; faces+
    helm-c-yasnippet
    ;; helm-gtags
    helm-org-rifle
    haskell-mode
    ;; lively
    ;; magit
    magit-filenotify   ;; Refresh status buffer when git tree changes
    magit-todos
    ;; magit-org-todos
    ;; nlinum
    ;; nlinum-relative
    ;; org-plus-contrib
    pdf-tools
    ;; indy
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
    swiper

    vue-mode
    prettier-js
    beacon

    hl-fill-column
    visual-fill-column
    keyfreq

    ;; Typescript dev
    ;; lsp-ui
    ;; lsp-mode
    ;; emacsql-psql
    ;; lsp-typescript
    ;; company
    ;; typescript-mode
    ;; eldoc
    ;; tide
    ;; web-mode

    ;; org-noter
    ;; interleave
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


(defun adamchandra/init-hl-fill-column            () "init hl-fill-column"               (use-package hl-fill-column            :defer t))
(defun adamchandra/init-visual-fill-column            () "init visual-fill-column"               (use-package visual-fill-column            :defer t))
(defun adamchandra/init-beacon()
  "init beacon"
  (use-package beacon
    :demand t
    :config (progn
              (custom-set-variables
               '(beacon-blink-when-point-moves-vertically 10)
               '(beacon-blink-when-focused t)
               '(beacon-blink-duration 0.3)
               '(beacon-blink-delay 0.1)
               '(beacon-color 0.5)
               );
	      (beacon-mode)
              )
    ))

(add-hook 'mmm-mode-hook
          (lambda ()
            (set-face-background 'mmm-default-submode-face "#fafafa")))

(defun adamchandra/init-vue-mode()
  "init vue-mode"
  (use-package vue-mode
    :defer t
    :config (progn)
    ))

(defun adamchandra/init-prettier-js ()
  "init prettier-js"
  (use-package prettier-js
    :defer t
    :config (progn
              (setq prettier-js-args '(
                                       "--trailing-comma" "all"
                                       "--bracket-spacing" "false"
                                       ))
              )
    ))

;; (defun adamchandra/init-indy()
;;   "init indy"
;;   (use-package indy
;;     :defer t
;;     :ensure t
;;     :init
;;     (setq indy-rules
;;           '(
;;             (erlang-mode . (
;;                             ((indy--prev 'indy--ends-on "->" "fun" "of" "begin") (indy--prev-tab 1))
;;                             ((indy--prev 'indy--ends-on ";") (indy--prev-tab -1))
;;                             ((and (indy--prev 'indy--ends-on "end") (indy--current 'indy--starts-with "end")) (indy--prev-tab -1))
;;                             ((indy--current 'indy--ends-on "end") (indy--prev-tab -1))
;;                             ((and (indy--prev 'indy--ends-on "[") (indy--current 'indy--starts-with "]")) (indy--prev-tab))
;;                             ((and (indy--prev 'indy--ends-on "{") (indy--current 'indy--starts-with "}")) (indy--prev-tab))
;;                             ((and (indy--prev 'indy--ends-on "(") (indy--current 'indy--starts-with ")")) (indy--prev-tab))
;;                             ((indy--current 'indy--starts-with "]" "}" ")") (indy--prev-tab -1))
;;                             ((indy--prev 'indy--ends-on "[" "{" "(") (indy--prev-tab 1))
;;                             ((indy--prev 'indy--ends-on ",") (indy--prev-tab))))
;;             (js2-mode . ())
;;             )
;;           )
;;     :config
;;     (add-hook 'erlang-mode-hook 'indy-mode)
;;     (add-hook 'js2-mode-hook 'indy-mode)
;;     )
;;   )



;; (defun adamchandra/init-interleave           () "init interleave"             (use-package interleave           :defer t))
;; (defun adamchandra/init-org-noter            () "init org-noter"              (use-package org-noter            :defer t))
;; (defun adamchandra/init-emacsql-psql            () "init emacsql-psql"              (use-package emacsql-psql            :defer t))

(defun adamchandra/init-add-node-modules-path () "init add-node-modules-path"
       (use-package add-node-modules-path
         :defer t
         :config (add-hook 'js-mode-hook #'add-node-modules-path)
         ))

(defun adamchandra/init-tern-auto-complete () "init tern-auto-complete" (use-package tern-auto-complete :defer t))
(defun adamchandra/init-helm-flycheck      () "init helm-flycheck"      (use-package helm-flycheck      :defer t))

(defun adamchandra/init-flycheck           () "init flycheck"
       (use-package flycheck
         :defer t
         :config (progn

                   (evil-define-key flycheck-mode-map
                     (kbd "M-n") 'flycheck-next-error
                     (kbd "M-p") 'flycheck-previous-error
                     )

                   (evil-leader/set-key
                     ;;"x" 'flycheck-compile
                     ;;"x" 'flycheck-copy-errors-as-kill
                     "eq" 'flycheck-describe-checker
                     "ec" 'flycheck-clear
                     ;;"x" 'display-local-help
                     ;;"x" 'flycheck-version
                     "eg" 'flycheck-buffer
                     "e?" 'flycheck-explain-error-at-point
                     "e/" 'flycheck-display-error-at-point
                     ;;"x" 'flycheck-manual
                     "ea" 'flycheck-list-errors
                     "en" 'flycheck-next-error
                     "ep" 'flycheck-previous-error
                     ;;"x" 'flycheck-select-checker
                     "ev" 'flycheck-verify-setup
                     ;;"x" 'flycheck-disable-checker
                     )
                   )
         )
       )

;; To automatically run it when opening a new buffer:
;; (Choose depending on your favorite mode.)

;; (eval-after-load 'js-mode
;;   '(add-hook 'js-mode-hook #'add-node-modules-path))

;; (eval-after-load 'js2-mode
;;   '(add-hook 'js2-mode-hook #'add-node-modules-path))
;; hl-fill-column     20181210.1204 installed             Highlight fill column.
;; visual-fill-column 20190129.21   installed             fill-column for visual-line-mode

(defun adamchandra/init-swiper                 () "init swiper"                 (use-package swiper                 :defer t))
(defun adamchandra/init-ag                 () "init ag"                 (use-package ag                 :defer t))
(defun adamchandra/init-elmacro            () "init elmacro"            (use-package elmacro            :defer t))
;; (defun adamchandra/init-ample-regexps   () "ample re init"           (use-package ample-regexps      :defer t))
;; (defun adamchandra/init-ggtags          () "ggtags init"             (use-package ggtags             :defer t))
(defun adamchandra/init-haskell-mode       () "init haskell mode"       (use-package haskell-mode       :defer t))

;; (defun adamchandra/init-lively          () "init lively"             (use-package lively             :defer t))
;; (defun adamchandra/init-lsp-ui             () "init lsp-ui"               (use-package lsp-ui         :defer t))
;; (defun adamchandra/init-lsp-mode           () "init lsp-mode"             (use-package lsp-mode       :defer t))
;; (defun adamchandra/init-lsp-typescript     () "init lsp-typescript"       (use-package lsp-typescript       :defer t))

(defun adamchandra/init-company            () "init company"              (use-package company              :defer t))
;; (defun adamchandra/init-typescript-mode    () "init typescript-mode"      (use-package typescript-mode      :defer t))

;; (defun adamchandra/init-nlinum             () "init nlinum"             (use-package nlinum             :defer t))
(defun adamchandra/init-helm-gtags         () "init helm-gtags"         (use-package helm-gtags         :defer t))
(defun adamchandra/init-helm-c-yasnippet   () "init helm-c-yasnippet"   (use-package helm-c-yasnippet   :defer t))

(defun adamchandra/init-magit-filenotify   () "init magit-filenotify"   (use-package magit-filenotify   :defer t))
;; (defun adamchandra/init-magit-org-todos   () "init magit-org-todos"     (use-package magit-org-todos   :defer t))
(defun adamchandra/init-magit-todos       () "init magit-todos"         (use-package magit-todos   :defer t))

(defun adamchandra/init-sws-mode           () "init sws-mode"           (use-package sws-mode           :defer t))
(defun adamchandra/init-wgrep              () "init wgrep"              (use-package wgrep              :defer t))
(defun adamchandra/init-helm-org-rifle     () "init helm-org-rifle"     (use-package helm-org-rifle     :defer t))
(defun adamchandra/init-pdf-tools          () "init pdf-tools"          (use-package pdf-tools          :defer t))
(defun adamchandra/init-wgrep-ack          () "init wgrep-ack"          (use-package wgrep-ack          :defer t))
(defun adamchandra/init-wgrep-ag           () "init wgrep-ag"           (use-package wgrep-ag           :defer t))
(defun adamchandra/init-wgrep-helm         () "init wgrep-helm"         (use-package wgrep-helm         :defer t))
(defun adamchandra/init-yaml-mode          () "init yaml"               (use-package yaml-mode          :defer t))
(defun adamchandra/init-ztree              () "init ztree"              (use-package ztree              :defer t))
(defun adamchandra/init-markdown-mode      () "init markdown"           (use-package markdown-mode      :defer t))
(defun adamchandra/init-markdown-mode+     () "init markdown+"          (use-package markdown-mode+     :defer t))


(defun adamchandra/init-keyfreq()
  "init keyfreq"
  (use-package keyfreq
    :init (progn)
    :config (progn
              (keyfreq-mode 1)
              (keyfreq-autosave-mode 1)
              )
    )
  )

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
