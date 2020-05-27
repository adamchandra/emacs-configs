;;;;;;;;;;;;;;;;;;;;;;;
;;
(message "loading adamchandra/packages.el")

(defvar adamchandra-packages
  '(
    add-node-modules-path
    ag
    auto-save-buffers-enhanced

    ;; flycheck
    helm-flycheck
    elmacro

    helm-c-yasnippet
    helm-org-rifle
    haskell-mode
    ;; magit-filenotify   ;; Refresh status buffer when git tree changes
    ;; magit-todos
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

    ;; javascript - requires 'npm -g indium' installation
    indium

    ;; pomidor
    ;; char-menu

    ;; Scala support
    scala-mode
    sbt-mode
    lsp-mode
    lsp-ui
    company-lsp
    ;; helm-gtags
    noflet
    ;; doom-themes


    ;; Dired Stuff

    dired-collapse    ;; Collapse unique nested paths in dired listing
    dired-dups        ;; Find duplicate files and display them in a dired buffer
    dired-efap        ;; Edit Filename At Point in a dired buffer
    dired-narrow      ;; Live-narrowing of search results for dired
    dired-rainbow     ;; Extended file highlighting according to its type
    dired-subtree     ;; Insert subdirectories in a tree-like fashion
    dired-toggle      ;; Show dired as sidebar and will not create new buffers when changing dir
    dired-filter      ;; Ibuffer-like filtering for dired
    dired-hacks-utils ;; Utilities and helpers for dired-hacks collection
    dired-icon        ;; A minor mode to display a list of associated icons in dired buffers.
    ;; dired-atool         Pack/unpack files with atool on dired.
    ;; dired-avfs          AVFS support for dired
    ;; dired-du            Dired with recursive directory sizes
    ;; dired-explorer      minor-mode provides Explorer like select file at dired.
    ;; dired-fdclone       dired functions and settings to mimic FDclone
    ;; dired-filetype-face  Set different faces for different filetypes in dired
    ;; dired-git-info      Show git info in dired
    ;; dired-hide-dotfiles  Hide dotfiles in dired
    ;; dired-imenu         imenu binding for dired mode
    ;; dired-k             highlight dired buffer by file size, modified time, git status
    ;; dired-launch        Use dired as a launcher
    ;; dired-open          Open files from dired using using custom actions
    ;; dired-quick-sort    Persistent quick sorting of dired buffers in various ways.
    ;; dired-ranger        Implementation of useful ranger features for dired
    ;; dired-recent        Dired visited paths history
    ;; dired-rifle         Call rifle(1) from dired
    ;; dired-rmjunk        A home directory cleanup utility for Dired.
    ;; dired-rsync         Allow rsync from dired buffers
    ;; dired-sidebar       Tree browser leveraging dired
    ;; dired-single        Reuse the current dired buffer to visit a directory
    ;; dired-toggle-sudo   Browse directory with sudo privileges.
    ;; diredfl             Extra font lock rules for a more colourful dired
    ;; diredful            colorful file names in dired buffers

    pandoc-mode

    ob-typescript
    ob-browser
    ob-ammonite

    ;; elpy
    )
  "List of all packages to install and/or initialize. Built-in packages which require an initialization must be listed explicitly in the list."
  )


(defvar adamchandra-excluded-packages
  '(
    org-bullets
    paradox
    ;; git-gutter+
    ;; git-gutter-fringe+
    ;; magit
    )
  "List of packages to exclude."
  )


;; (defun adamchandra/init-XXX            () "init XXX"               (use-package XXX            :defer t))
;; (defun adamchandra/init-XXX()
;;   "init XXX"
;;   (use-package XXX
;;     :defer t
;;   ))

;; (defun adamchandra/init-doom-themes()
;;   "init doom-themes"
;;   (use-package doom-themes
;;     :defer t
;;   ))

;; (defun adamchandra/init-elpy()
;;   "init elpy"
;;   (use-package elpy
;;     :defer t
;;   ))

(defun adamchandra/init-ob-typescript            () "init ob-typescript"               (use-package ob-typescript            :defer t))
(defun adamchandra/init-ob-browser            () "init ob-browser"               (use-package ob-browser            :defer t))
(defun adamchandra/init-ob-ammonite            () "init ob-ammonite"               (use-package ob-ammonite            :defer t))

(defun adamchandra/init-pandoc-mode()
  "init pandoc-mode"
  (use-package pandoc-mode
    :defer t
    :config (progn
              (require 'markdown-mode)
              (add-hook 'markdown-mode-hook 'pandoc-mode)
              (setq markdown-command
                    (concat
                     "/usr/local/bin/pandoc"
                     " --from=markdown --to=html"
                     " --standalone --mathjax --highlight-style=pygments"
                     ))
              (setq markdown-live-preview-delete-export 'delete-on-export)
              )
  ))

(defun adamchandra/init-dired-collapse             () "init dired-collapse "               (use-package dired-collapse             :defer t))
(defun adamchandra/init-dired-dups                 () "init dired-dups     "               (use-package dired-dups                 :defer t))
(defun adamchandra/init-dired-efap                 () "init dired-efap     "               (use-package dired-efap                 :defer t))
(defun adamchandra/init-dired-narrow               () "init dired-narrow   "               (use-package dired-narrow               :defer t))
(defun adamchandra/init-dired-rainbow              () "init dired-rainbow  "               (use-package dired-rainbow              :defer t))
(defun adamchandra/init-dired-subtree              () "init dired-subtree  "               (use-package dired-subtree              :defer t))
(defun adamchandra/init-dired-toggle               () "init dired-toggle   "               (use-package dired-toggle               :defer t))
(defun adamchandra/init-dired-filter               () "init dired-filter      "           (use-package dired-filter                  :defer t))
(defun adamchandra/init-dired-hacks-utils          () "init dired-hacks-utils "           (use-package dired-hacks-utils             :defer t))
(defun adamchandra/init-dired-icon                 () "init dired-icon        "           (use-package dired-icon                    :defer t))


(defun adamchandra/init-indium()
  "init indium"
  (use-package indium
    :defer t
    :config (progn
              (require 'js2-mode)
              (add-hook 'js2-mode-hook #'indium-interaction-mode)
              (custom-set-faces
               ;; indium-breakpoint-face '((t (:inherit fringe :foreground "#006c3b")))
               )
              )
  ))


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
               '(beacon-blink-when-focused nil)
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



(defun adamchandra/init-flycheck() "init flycheck"
       (use-package flycheck
         :defer t
         :config (progn
                   (require 'ts-config)

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

;; (defun adamchandra/init-helm-gtags         () "init helm-gtags"         (use-package helm-gtags         :defer t))
(defun adamchandra/init-helm-c-yasnippet   () "init helm-c-yasnippet"   (use-package helm-c-yasnippet   :defer t))

;; (defun adamchandra/init-magit-filenotify   () "init magit-filenotify"   (use-package magit-filenotify   :defer t))
;; (defun adamchandra/init-magit-todos       () "init magit-todos"         (use-package magit-todos   :defer t))

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
  (spacemacs/enable-flycheck 'scala-mode))

(defun adamchandra/init-noflet ()
  (use-package noflet))

(defun adamchandra/init-lsp-ui()
  "init lsp-ui"
  (use-package lsp-ui
    :defer t
    ))

;; (use-package posframe
;;   ;; Posframe is a pop-up tool that must be manually installed for dap-mode
;;   )

(defun adamchandra/init-lsp-mode()
  "init lsp-mode"
  (use-package lsp-mode
    :defer t
    ;; Optional - enable lsp-mode automatically in scala files
    :hook
    (scala-mode . lsp)
    (lsp-mode . lsp-lens-mode)
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
      (message "running :config adamchandra/init-scala-mode")
      (require 'scala-config)
      (acs-config-scala-mode)
      )))

(defun adamchandra/post-init-ggtags ()
  (add-hook 'scala-mode-local-vars-hook #'spacemacs/ggtags-mode-enable))

;; (defun adamchandra/post-init-helm-gtags ()
;;   (spacemacs/helm-gtags-define-keys-for-mode 'scala-mode))


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
