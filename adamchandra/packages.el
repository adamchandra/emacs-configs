;;;;;;;;;;;;;;;;;;;;;;;
;;
(message "loading adamchandra/packages.el")

(defvar adamchandra-packages
  '(
    add-node-modules-path
    ag
    auto-save-buffers-enhanced

    flycheck
    helm-flycheck
    elmacro

    helm-c-yasnippet
    helm-org-rifle
    haskell-mode
    magit-filenotify   ;; Refresh status buffer when git tree changes
    magit-todos
    pdf-tools
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

    terminal-here

    )
  "List of all packages to install and/or initialize. Built-in packages which require an initialization must be listed explicitly in the list."
  )


(defvar adamchandra-excluded-packages
  '(
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
                   (require 'ts-config)
                   (init-typescript-flychecker)
                   ;;   (setf (flycheck-checker-get 'typescript-tide 'next-checkers) '())
                   ;;   (flycheck-add-next-checker 'typescript-tide '(warning . my/typescript-tslint) 'append)

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


(defun adamchandra/init-terminal-here                 () "init terminal-here"                 (use-package terminal-here                 :defer t))

(defun adamchandra/init-swiper                 () "init swiper"                 (use-package swiper                 :defer t))
(defun adamchandra/init-ag                 () "init ag"                 (use-package ag                 :defer t))
(defun adamchandra/init-elmacro            () "init elmacro"            (use-package elmacro            :defer t))
(defun adamchandra/init-haskell-mode       () "init haskell mode"       (use-package haskell-mode       :defer t))


(defun adamchandra/init-company            () "init company"              (use-package company              :defer t))

(defun adamchandra/init-helm-gtags         () "init helm-gtags"         (use-package helm-gtags         :defer t))
(defun adamchandra/init-helm-c-yasnippet   () "init helm-c-yasnippet"   (use-package helm-c-yasnippet   :defer t))

(defun adamchandra/init-magit-filenotify   () "init magit-filenotify"   (use-package magit-filenotify   :defer t))
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
