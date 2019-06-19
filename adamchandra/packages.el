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

    intero
    minions

    ;; pomidor
    ;; char-menu

    ;; Scala support
    scala-mode
    sbt-mode
    lsp-mode
    lsp-ui
    company-lsp
    helm-gtags
    noflet

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
;; (defun adamchandra/init-XXX()
;;   "init XXX"
;;   (use-package XXX
;;     :defer t
;;   ))

;; (defun adamchandra/init-pomidor()
;;   "init pomidor"
;;   (use-package pomidor
;;     :bind (("<f12>" . pomidor))
;;     :config (setq pomidor-sound-tick nil
;;                   pomidor-sound-tack nil)
;;     :hook (pomidor-mode . (lambda ()
;;                             (display-line-numbers-mode -1) ; Emacs 26.1+
;;                             (setq left-fringe-width 0 right-fringe-width 0)
;;                             (setq left-margin-width 2 right-margin-width 0)
;;                             ;; force fringe update
;;                             (set-window-buffer nil (current-buffer)))))

;;   )


(defun adamchandra/init-minions()
  "init minions"
  (use-package minions
    :config (minions-mode 1)
    ))

(defun adamchandra/init-intero()
  "init intero"
  (use-package intero
    :defer t
    :mode ("\\(\\.[gh]s\\'\\|\\.hsc\\'\\)" . haskell-mode)
    ) )

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


;; Error (use-package): flycheck/:config: :predicate (function (lambda nil (and
;; (executable-find-prefer-node-modules "tslint") (flycheck-buffer-saved-p))))
;; of syntax checker my/typescript-tslint is not a function

(defun adamchandra/init-flycheck() "init flycheck"
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
      ;; (spacemacs|diminish yas-minor-mode " Ⓨ")
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


(defun adamchandra/init-char-menu()
  "init char-menu"
  (use-package char-menu
    :defer t
    :config
    (progn
      (setq char-menu
            '("—" "‘’" "“”" "…" "«»" "–"
              ("Checks" "✔" "✓")
              ("Typography" "•" "©" "†" "‡" "°" "·" "§" "№" "★")
              ("Math"       "≈" "≡" "≠" "∞" "×" "±" "∓" "÷" "√")
              ("Arrows"     "←" "→" "↑" "↓" "⇐" "⇒" "⇑" "⇓")
              ("Greek"      "α" "β" "Y" "δ" "ε" "ζ" "η" "θ" "ι" "κ" "λ" "μ"
               "ν" "ξ" "ο" "π" "ρ" "σ" "τ" "υ" "φ" "χ" "ψ" "ω"))
            )

      (evil-leader/set-key
        "xx" 'char-menu
        )
      )
    ))

(defun adamchandra/post-init-flycheck ()
  (spacemacs/add-flycheck-hook 'scala-mode))

(defun adamchandra/init-noflet ()
  (use-package noflet))

(defun adamchandra/init-lsp-ui()
  "init lsp-ui"
  (use-package lsp-ui
    :defer t
    ))

(defun adamchandra/init-lsp-mode()
  "init lsp-mode"
  (use-package lsp-mode
    :defer t
    ;; Optional - enable lsp-mode automatically in scala files
    :hook (scala-mode . lsp)
    :config (setq lsp-prefer-flymake nil)
    ))

(defun adamchandra/init-company-lsp()
  "init company-lsp"
  (use-package company-lsp
    :defer t
    ))

(defun adamchandra/pre-init-org ()
  (spacemacs|use-package-add-hook org
    :post-config (add-to-list 'org-babel-load-languages '(scala . t))))

(defun adamchandra/init-sbt-mode ()
  (use-package sbt-mode
    :defer t
    :init (spacemacs/set-leader-keys-for-major-mode 'scala-mode
            "b." 'sbt-hydra
            "bb" 'sbt-command)))

(defun adamchandra/init-scala-mode ()
  (use-package scala-mode
    :defer t

    :mode "\\.s\\(cala\\|bt\\)$"

    :init
    (progn
      (dolist (ext '(".cfe" ".cfs" ".si" ".gen" ".lock"))
        (add-to-list 'completion-ignored-extensions ext)))
    :config
    (progn
      (message "running :config adamchandra/scala-mode")

      (add-hook 'scala-mode-hook 'turn-on-auto-revert-mode)

      ;; Automatically insert asterisk in a comment when enabled
      (defun scala/newline-and-indent-with-asterisk ()
        (interactive)
        (newline-and-indent)
        (when scala-auto-insert-asterisk-in-comments
          (scala-indent:insert-asterisk-on-multiline-comment)))

      (evil-define-key 'insert scala-mode-map
        (kbd "RET") 'scala/newline-and-indent-with-asterisk)

      (evil-define-key 'normal scala-mode-map "J" 'spacemacs/scala-join-line)

      (setq scala-indent:step 2
            scala-indent:indent-value-expression nil
            scala-indent:align-parameters nil
            scala-indent:align-forms t

            ;; (defconst scala-indent:eager-strategy 0
            ;; (defconst scala-indent:operator-strategy 1
            ;; (defconst scala-indent:reluctant-strategy 2
            scala-indent:default-run-on-strategy scala-indent:operator-strategy

            scala-indent:add-space-for-scaladoc-asterisk t
            scala-indent:use-javadoc-style nil
            )
      )))

(defun adamchandra/post-init-ggtags ()
  (add-hook 'scala-mode-local-vars-hook #'spacemacs/ggtags-mode-enable))

(defun adamchandra/post-init-helm-gtags ()
  (spacemacs/helm-gtags-define-keys-for-mode 'scala-mode))


;; (use-package package-name
;;   :init            ;; Code to run before PACKAGE-NAME has been loaded.
;;   :config          ;; Code to run after PACKAGE-NAME has been loaded
;;   :mode            ;; Form to be added to ‘auto-mode-alist’.
;;   :magic           ;; Form to be added to ‘magic-mode-alist’.
;;   :magic-fallback  ;; Form to be added to ‘magic-fallback-mode-alist’.
;;   :interpreter     ;; Form to be added to ‘interpreter-mode-alist’.
;;   :hook            ;; Specify hook(s) to attach this package to.
;;   :bind            ;; Bind keys, and define autoloads for the bound commands.
;;   :bind*           ;; Bind keys, and define autoloads for the bound commands, *overriding all minor mode bindings*.
;;   :bind-keymap     ;; Bind a key prefix to an auto-loaded keymap defined in the package.  This is like ‘:bind’, but for keymaps.
;;   :bind-keymap*    ;; Like ‘:bind-keymap’, but overrides all minor mode bindings
;;   :defer           ;; Defer loading of package
;;   :after           ;; Defer loading of a package until after any of the named features are loaded.
;;   :demand          ;; Prevent deferred loading in all cases.
;;   :if EXPR         ;; Initialize and load only if EXPR evaluates to a non-nil value.
;;   :disabled        ;; The package is ignored completely if this keyword is present.
;;   :defines         ;; Declare certain variables to silence the byte-compiler.
;;   :functions       ;; Declare certain functions to silence the byte-compiler.
;;   :load-path       ;; Add to the ‘load-path’ before attempting to load the package.
;;   :diminish        ;; Support for diminish.el (if installed).
;;   :delight         ;; Support for delight.el (if installed).
;;   :custom          ;; Call ‘customize-set-variable’ with each variable definition.
;;   :custom-face     ;; Call ‘customize-set-faces’ with each face definition.
;;   :ensure          ;; Loads the package using package.el if necessary.
;;   :pin             ;; Pin the package to an archive.
;; )
