;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     csv
     python
     ;; sql
     html
     javascript
     typescript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     ;; auto-completion
     ;; better-defaults
     emacs-lisp
     git
     ;; github
     markdown
     ;; org
     ;; spell-checking
     syntax-checking
     ;; version-control
     java
     ;; gtags
     ;; scala
     adamchandra
     ;; themes-megapack
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    highlight-parentheses
                                    )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."

  ;; (require 'package)
  ;; (setq package-enable-at-startup nil)
  ;; Use local package archives
  ;; (setq package-archives '(
  ;;                          ("melpa" . "~/.emacs-configs/package-mirrors/melpa/")
  ;;                          ("gnu"   . "~/.emacs-configs/package-mirrors/gnu/"))
  ;;       ;;("org"   . "~/.emacs-configs/package-mirrors/org/")
  ;;       )

  (setq  dotspacemacs-enable-server t)
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         leuven
                         professional
                         doom-solarized-light
                         ;; leuven-prime
                         ;; sanityinc-solarized-light
                         ;; zenburn
                         ;; spacemacs-light
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.

   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 100
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 100
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   dotspacemacs-default-font '("Source Code Pro"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)

   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  (push '(zmq . "melpa") package-pinned-packages)

  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (with-eval-after-load 'helm
    (setq helm-display-function 'helm-default-display-buffer))

  (adamchandra/final-config)
  ;; (find-my-theme-file)

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(beacon-blink-delay 0.1)
 '(beacon-blink-duration 0.3)
 '(beacon-blink-when-focused t)
 '(beacon-blink-when-point-moves-vertically 10)
 '(beacon-color 0.5)
 '(bmkp-last-as-first-bookmark-file "/home/saunders/.emacs.d/bookmarks")
 '(browse-url-browser-function (quote browse-url-default-browser))
 '(browse-url-firefox-program "firefox-stable")
 '(case-fold-search nil)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#BBBBBB" t)
 '(global-evil-search-highlight-persist t)
 '(global-linum-mode nil)
 '(google-translate-default-source-language "es")
 '(google-translate-default-target-language "en")
 '(helm-ag-base-command "rg-wrapper --vimgrep --no-heading --smart-case")
 '(helm-ag-use-agignore nil)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(hl-sexp-background-color "#efebe9")
 '(js-indent-level 2)
 '(linum-format " %7i ")
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-startup-folded nil)
 '(package-selected-packages
   (quote
    (names dired-icon dired-filter dired-toggle dired-subtree dired-rainbow dired-narrow dired-efap dired-dups dired-collapse dired-hacks-utils eslint-fix helm-rg json-process-client indium handlebars-mode company-lsp pomidor alert log4e gntp minions char-menu intero flycheck-pos-tip pos-tip jupyter websocket zmq terminal-here transient lv keyfreq leuven-prime-theme hl-fill-column visual-fill-column edit-indirect ssass-mode vue-html-mode ivy beacon prettier-js vue-mode add-node-modules-path swiper htmlize swiper-helm magit-todos magit-org-todos graphql treepy lsp-typescript parent-mode flx popup lsp-ui lsp-mode wgrep helm-org-rifle csv-mode gitignore-mode zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme epl org-noter interleave elmacro ghub let-alist tern-auto-complete auto-complete tide typescript-mode indy company-web web-completion-data company-tern company-emacs-eclim company-anaconda xref-js2 helm-flycheck flycheck goto-chg dash-functional s diminish nlinum f winum magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito pcache ht bookmark+ sws-mode tablist evil avy packed yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode anaconda-mode pythonic sql-indent markdown-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode bind-key bind-map scala-mode spinner hydra request org company highlight iedit git-gutter tern hide-comnt anzu undo-tree dash livid-mode skewer-mode json-mode js2-refactor multiple-cursors web-beautify simple-httpd json-snatcher json-reformat js2-mode js-doc coffee-mode which-key spaceline persp-mode org-plus-contrib hl-todo helm-projectile helm-ag haskell-mode evil-unimpaired sbt-mode smartparens yasnippet projectile helm helm-core magit magit-popup git-commit with-editor async ztree yaml-mode ws-butler window-numbering wgrep-helm wgrep-ag wgrep-ack volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme smeargle restart-emacs rainbow-delimiters quelpa powerline popwin pkg-info pdf-tools pcre2el paradox orgit org-bullets open-junk-file noflet neotree move-text mmm-mode markdown-toc markdown-mode+ magit-gitflow magit-filenotify macrostep lorem-ipsum lively linum-relative link-hint info+ indent-guide ido-vertical-mode hungry-delete highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-c-yasnippet google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter+ gh-md ggtags flx-ido fill-column-indicator fancy-battery faces+ facemenu+ eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu ensime elisp-slime-nav eclim dumb-jump define-word column-enforce-mode clean-aindent-mode auto-save-buffers-enhanced auto-highlight-symbol auto-compile ample-regexps aggressive-indent ag adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(tide-completion-detailed t)
 '(tide-completion-ignore-case t)
 '(truncate-lines t)
 '(typescript-indent-level 2)
 '(vc-annotate-background "#0E0E0E")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#616161")
     (40 . "#9E9E9E")
     (60 . "#9E9E9E")
     (80 . "#C3C3C3")
     (100 . "#C3C3C3")
     (120 . "#DADADA")
     (140 . "#DADADA")
     (160 . "#E8E8E8")
     (180 . "#E8E8E8")
     (200 . "#E8E8E8")
     (220 . "#F1F1F1")
     (240 . "#F1F1F1")
     (260 . "#F1F1F1")
     (280 . "#F6F6F6")
     (300 . "#F6F6F6")
     (320 . "#F6F6F6")
     (340 . "#FAFAFA")
     (360 . "#FAFAFA"))))
 '(vc-annotate-very-old-color "#DADADA")
 '(volatile-highlights-mode t)
 '(vue-modes
   (quote
    ((:type template :name nil :mode web-mode)
     (:type template :name html :mode web-mode)
     (:type template :name jade :mode jade-mode)
     (:type template :name pug :mode pug-mode)
     (:type template :name slm :mode slim-mode)
     (:type template :name slim :mode slim-mode)
     (:type script :name nil :mode js-mode)
     (:type script :name js :mode js-mode)
     (:type script :name es6 :mode js-mode)
     (:type script :name babel :mode js-mode)
     (:type script :name coffee :mode coffee-mode)
     (:type script :name ts :mode typescript-mode)
     (:type script :name typescript :mode typescript-mode)
     (:type script :name tsx :mode typescript-tsx-mode)
     (:type style :name nil :mode css-mode)
     (:type style :name css :mode css-mode)
     (:type style :name stylus :mode stylus-mode)
     (:type style :name less :mode less-css-mode)
     (:type style :name postcss :mode css-mode)
     (:type style :name scss :mode css-mode)
     (:type style :name sass :mode ssass-mode))))
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(when
      (or
       (not
        (boundp
         (quote ansi-term-color-vector)))
       (not
        (facep
         (aref ansi-term-color-vector 0)))))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(evil-search-highlight-persist-highlight-face ((t (:inherit region :background "SlateGray2"))))
 '(line-number ((t (:inherit (shadow default) :background "white smoke"))))
 '(line-number-current-line ((t (:inherit line-number :background "gold1"))))
 '(nxml-element-local-name ((t (:background "#ffffff" :foreground "#031033" :box nil :weight bold))))
 '(nxml-outline-active-indicator ((t (:inherit nxml-outline-indicator))))
 '(org-checkbox ((t (:background "aff8c0" :foreground "black" :weight semi-bold))))
 '(org-level-1 ((t (:height 1.1 :weight bold :slant normal :overline "#A7A7A7" :foreground "#3C3C3C" :background "#F0F0F0"))))
 '(org-level-2 ((t (:height 1.0 :weight bold :slant normal :overline "#123555" :foreground "#923555" :background "#E5F4FB"))))
 '(org-level-3 ((t (:height 1.0 :weight bold :slant normal :foreground "#103522" :background nil))))
 '(org-level-4 ((t (:height 1.0 :weight bold :slant normal :foreground "#0022AA"))))
 '(org-level-5 ((t (:height 1.0 :weight bold :slant normal :foreground "#000022"))))
 '(org-level-6 ((t (:height 1.0 :weight bold :slant normal :foreground "#B077CC"))))
 '(org-level-7 ((t (:height 1.0 :weight bold :slant normal :foreground "#0EAE2C"))))
 '(org-level-8 ((t (:height 1.0 :weight bold :slant italic :foreground "#FD8008"))))
 '(scala-font-lock:var-face ((t (:slant italic :weight bold)))))

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(beacon-blink-delay 0.1)
 '(beacon-blink-duration 0.3)
 '(beacon-blink-when-focused t)
 '(beacon-blink-when-point-moves-vertically 10)
 '(beacon-color 0.5)
 '(bmkp-last-as-first-bookmark-file "/home/saunders/.emacs.d/bookmarks")
 '(browse-url-browser-function 'browse-url-default-browser)
 '(browse-url-firefox-program "firefox-stable")
 '(case-fold-search nil)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   '("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#BBBBBB" t)
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(frame-background-mode 'dark)
 '(fringe-mode 12 nil (fringe))
 '(global-evil-search-highlight-persist t)
 '(global-linum-mode nil)
 '(google-translate-default-source-language "es" t)
 '(google-translate-default-target-language "en" t)
 '(helm-ag-base-command "rg-wrapper --vimgrep --no-heading --smart-case")
 '(helm-ag-use-agignore nil)
 '(helm-completion-style 'emacs)
 '(highlight-changes-colors '("#d33682" "#6c71c4"))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    '("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2")))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   '(("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100)))
 '(hl-bg-colors
   '("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342"))
 '(hl-fg-colors
   '("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3"))
 '(hl-paren-background-colors '("#e8fce8" "#c1e7f8" "#f8e8e8"))
 '(hl-paren-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900"))
 '(hl-sexp-background-color "#efebe9")
 '(indicate-buffer-boundaries 'left)
 '(indicate-empty-lines nil)
 '(jdee-db-active-breakpoint-face-colors (cons "#FFFBF0" "#268bd2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#FFFBF0" "#859900"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#FFFBF0" "#E1DBCD"))
 '(js-indent-level 2)
 '(linum-format " %7i ")
 '(lsp-enable-folding nil)
 '(lsp-file-watch-ignored
   '("[/\\\\]\\.git\\'" "[/\\\\]\\.hg\\'" "[/\\\\]\\.bzr\\'" "[/\\\\]_darcs\\'" "[/\\\\]\\.svn\\'" "[/\\\\]_FOSSIL_\\'" "[/\\\\]\\.idea\\'" "[/\\\\]\\.ensime_cache\\'" "[/\\\\]\\.eunit\\'" "[/\\\\]node_modules" "[/\\\\]\\.fslckout\\'" "[/\\\\]\\.tox\\'" "[/\\\\]dist\\'" "[/\\\\]dist-newstyle\\'" "[/\\\\]\\.stack-work\\'" "[/\\\\]\\.bloop\\'" "[/\\\\]\\.metals\\'" "[/\\\\]target\\'" "[/\\\\]\\.ccls-cache\\'" "[/\\\\]\\.vscode\\'" "[/\\\\]\\.deps\\'" "[/\\\\]build-aux\\'" "[/\\\\]autom4te.cache\\'" "[/\\\\]\\.reference\\'" "[/\\\\]bin/Debug\\'" "[/\\\\]obj\\'" "\\w+.d\\'"))
 '(lsp-keep-workspace-alive nil)
 '(lsp-restart 'ignore)
 '(lsp-ui-doc-show-with-cursor nil)
 '(lsp-ui-doc-use-webkit t)
 '(lsp-ui-sideline-actions-icon nil)
 '(lsp-ui-sideline-delay 0.5)
 '(lsp-ui-sideline-diagnostic-max-line-length 180)
 '(magit-diff-use-overlays nil)
 '(markdown-command "pandoc")
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(objed-cursor-color "#dc322f")
 '(org-startup-folded nil)
 '(package-selected-packages
   '(ebuku frog-jump-buffer rainbow-mode flymd markdown-preview-eww pandoc-mode names dired-icon dired-filter dired-toggle dired-subtree dired-rainbow dired-narrow dired-efap dired-dups dired-collapse dired-hacks-utils eslint-fix helm-rg json-process-client indium handlebars-mode company-lsp pomidor alert log4e gntp minions char-menu intero flycheck-pos-tip pos-tip jupyter websocket zmq terminal-here transient lv keyfreq leuven-prime-theme hl-fill-column visual-fill-column edit-indirect ssass-mode vue-html-mode ivy beacon prettier-js vue-mode add-node-modules-path swiper htmlize swiper-helm magit-todos magit-org-todos graphql treepy lsp-typescript parent-mode flx popup lsp-ui lsp-mode wgrep helm-org-rifle csv-mode gitignore-mode zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme epl org-noter interleave elmacro ghub let-alist tern-auto-complete auto-complete tide typescript-mode indy company-web web-completion-data company-tern company-emacs-eclim company-anaconda xref-js2 helm-flycheck flycheck goto-chg dash-functional s diminish nlinum f winum magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito pcache ht bookmark+ sws-mode tablist evil avy packed yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode anaconda-mode pythonic sql-indent markdown-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode bind-key bind-map scala-mode spinner hydra request org company highlight iedit git-gutter tern hide-comnt anzu undo-tree dash livid-mode skewer-mode json-mode js2-refactor multiple-cursors web-beautify simple-httpd json-snatcher json-reformat js2-mode js-doc coffee-mode which-key spaceline persp-mode org-plus-contrib hl-todo helm-projectile helm-ag haskell-mode evil-unimpaired sbt-mode smartparens yasnippet projectile helm helm-core magit magit-popup git-commit with-editor async ztree yaml-mode ws-butler window-numbering wgrep-helm wgrep-ag wgrep-ack volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme smeargle restart-emacs rainbow-delimiters quelpa powerline popwin pkg-info pdf-tools pcre2el paradox orgit org-bullets open-junk-file noflet neotree move-text mmm-mode markdown-toc markdown-mode+ magit-gitflow magit-filenotify macrostep lorem-ipsum lively linum-relative link-hint info+ indent-guide ido-vertical-mode hungry-delete highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-c-yasnippet google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter+ gh-md ggtags flx-ido fill-column-indicator fancy-battery faces+ facemenu+ eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu ensime elisp-slime-nav eclim dumb-jump define-word column-enforce-mode clean-aindent-mode auto-save-buffers-enhanced auto-highlight-symbol auto-compile ample-regexps aggressive-indent ag adaptive-wrap ace-window ace-link ace-jump-helm-line))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(rustic-ansi-faces
   ["#FDF6E3" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#556b72"])
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(sml/active-background-color "#c1e7f8")
 '(sml/active-foreground-color "#000000")
 '(sml/inactive-background-color "#0067a8")
 '(sml/inactive-foreground-color "#000000")
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(tide-completion-detailed t)
 '(tide-completion-ignore-case t)
 '(truncate-lines t)
 '(typescript-indent-level 2)
 '(vc-annotate-background "#0E0E0E")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#616161")
     (40 . "#9E9E9E")
     (60 . "#9E9E9E")
     (80 . "#C3C3C3")
     (100 . "#C3C3C3")
     (120 . "#DADADA")
     (140 . "#DADADA")
     (160 . "#E8E8E8")
     (180 . "#E8E8E8")
     (200 . "#E8E8E8")
     (220 . "#F1F1F1")
     (240 . "#F1F1F1")
     (260 . "#F1F1F1")
     (280 . "#F6F6F6")
     (300 . "#F6F6F6")
     (320 . "#F6F6F6")
     (340 . "#FAFAFA")
     (360 . "#FAFAFA")))
 '(vc-annotate-very-old-color "#DADADA")
 '(volatile-highlights-mode t)
 '(vue-modes
   '((:type template :name nil :mode web-mode)
     (:type template :name html :mode web-mode)
     (:type template :name jade :mode jade-mode)
     (:type template :name pug :mode pug-mode)
     (:type template :name slm :mode slim-mode)
     (:type template :name slim :mode slim-mode)
     (:type script :name nil :mode js-mode)
     (:type script :name js :mode js-mode)
     (:type script :name es6 :mode js-mode)
     (:type script :name babel :mode js-mode)
     (:type script :name coffee :mode coffee-mode)
     (:type script :name ts :mode typescript-mode)
     (:type script :name typescript :mode typescript-mode)
     (:type script :name tsx :mode typescript-tsx-mode)
     (:type style :name nil :mode css-mode)
     (:type style :name css :mode css-mode)
     (:type style :name stylus :mode stylus-mode)
     (:type style :name less :mode less-css-mode)
     (:type style :name postcss :mode css-mode)
     (:type style :name scss :mode css-mode)
     (:type style :name sass :mode ssass-mode)))
 '(warning-suppress-log-types
   '((comp)
     (comp)
     (comp)
     (comp)
     (comp)
     yasnippet backquote-change))
 '(warning-suppress-types '((comp) (comp) (comp) (comp) yasnippet backquote-change))
 '(weechat-color-list
   '(unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496"))
 '(when
      (or
       (not
        (boundp 'ansi-term-color-vector))
       (not
        (facep
         (aref ansi-term-color-vector 0)))))
 '(window-divider-mode nil)
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(error ((t (:background "yellow" :foreground "red" :underline nil :slant italic))))
 '(evil-search-highlight-persist-highlight-face ((t (:inherit region :background "SlateGray2"))))
 '(line-number ((t (:inherit (shadow default) :background "white smoke"))))
 '(line-number-current-line ((t (:inherit line-number :background "gold1"))))
 '(lsp-modeline-code-actions-preferred-face ((t (:foreground "navy"))))
 '(lsp-ui-peek-list ((t (:background "gainsboro"))))
 '(lsp-ui-peek-peek ((t (:background "gainsboro"))))
 '(lsp-ui-sideline-code-action ((t (:background "yellow" :foreground "dark gray" :slant italic))))
 '(lsp-ui-sideline-current-symbol ((t (:foreground "gray" :box (:line-width (1 . -1) :color "white") :weight bold))))
 '(nxml-element-local-name ((t (:background "#ffffff" :foreground "#031033" :box nil :weight bold))))
 '(nxml-outline-active-indicator ((t (:inherit nxml-outline-indicator))))
 '(org-checkbox ((t (:background "aff8c0" :foreground "black" :weight semi-bold))))
 '(org-level-1 ((t (:height 1.1 :weight bold :slant normal :overline "#A7A7A7" :foreground "#3C3C3C" :background "#F0F0F0"))))
 '(org-level-2 ((t (:height 1.0 :weight bold :slant normal :overline "#123555" :foreground "#923555" :background "#E5F4FB"))))
 '(org-level-3 ((t (:height 1.0 :weight bold :slant normal :foreground "#103522" :background nil))))
 '(org-level-4 ((t (:height 1.0 :weight bold :slant normal :foreground "#0022AA"))))
 '(org-level-5 ((t (:height 1.0 :weight bold :slant normal :foreground "#000022"))))
 '(org-level-6 ((t (:height 1.0 :weight bold :slant normal :foreground "#B077CC"))))
 '(org-level-7 ((t (:height 1.0 :weight bold :slant normal :foreground "#0EAE2C"))))
 '(org-level-8 ((t (:height 1.0 :weight bold :slant italic :foreground "#FD8008"))))
 '(scala-font-lock:var-face ((t (:slant italic :weight bold))))
 '(warning ((t (:background "yellow" :foreground "dark blue" :slant italic)))))
);
