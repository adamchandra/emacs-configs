
(defconst *home-emacs-support* (expand-file-name "~/emacs/"))
(defconst *emacs-root*
  (cond
   ((file-directory-p *home-emacs-support*) *home-emacs-support*)
   (t nil)))


;; (load-theme 'darkburn t)


(setq adamchandra-layer-path "~/projects/the-toolshed/emacsen/emacs-configs/adamchandra/packages.el")

(defun company-my-setup ()
  (when (boundp 'company-backends)
    (make-local-variable 'company-backends)

    ;; remove
    ;; (setq company-backends (delete 'company-dabbrev company-backends))

    (setq company-backends '(
                            ensime-company
                            ;; company-bbdb
                            ;; company-nxml
                            ;; company-css
                            ;; company-eclim
                            ;; company-semantic
                            ;; company-clang
                            ;; company-xcode
                            ;; company-cmake
                            ;; company-capf
                            ;; company-files
                            ;; (company-dabbrev-code company-gtags company-etags company-keywords)
                            ;; company-oddmuse
                            ))

    ))


(remove-hook 'scala-mode-hook 'company-my-setup)
(add-hook 'scala-mode-hook 'company-my-setup t)

; (beacon-mode t)

(setq *adams-config-ran* nil)
(setq dotspacemacs-helm-use-fuzzy nil)

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

      (add-hook 'scala-mode-hook 'turn-on-auto-revert-mode)

      (setq
       scala-indent:step 2
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

      )
    ))

;; (defun autosave-file-buffer ()
;;   (interactive)
;;   (if (buffer-file-name)
;;       (save-buffer)
;;     )
;;   )

(defun enhanced-save-buffer ()
  (interactive)
  (progn
    (delete-trailing-whitespace)
    (save-buffer)))


(defun disable-autosave ()
  (progn
    (setq auto-save-buffers-enhanced-activity-flag nil)
    ))

(defun enable-autosave ()
  (progn
    (setq auto-save-buffers-enhanced-activity-flag t)
    ))

(defun adamchandra/final-config ()
  (interactive)
  (if (not *adams-config-ran*)
      (progn
        (message "adamchandra/final-config running")
        (setq *adams-config-ran* t)

        (setq *acs-layer-path*  (configuration-layer/get-layer-path 'adamchandra))
        (push *acs-layer-path* load-path)
        (setq *theme-path* (concat *acs-layer-path*  "extensions/leuven-prime-theme/leuven-prime-theme.el"))

        ;; prevent .#filname.xx files (which cause a problem w/ensime)
        (setq create-lockfiles nil)

        (adamchandra/init-scala-mode)

        (spacemacs/set-leader-keys
          "bk" 'spacemacs/kill-this-buffer
          "gi" 'sync-intellij
          )

        (setq ensime-log-events nil
              ensime--debug-messages nil
              ensime-save-before-compile t
              ensime-typecheck-idle-interval 0.5
              ensime-typecheck-interval 2.0
              ensime-typecheck-when-idle nil
              ensime-startup-snapshot-notification nil
              ensime-startup-notification nil
              ensime-tooltip-hints nil
              ensime-type-tooltip-hints nil
              ensime-sem-high-enabled-p t
              debug-on-error nil
              ;;debug-on-quit t
              )


        (add-hook 'evil-insert-state-entry-hook 'disable-autosave)
        (add-hook 'evil-insert-state-exit-hook 'enable-autosave)
        ;; (add-hook 'evil-insert-state-exit-hook 'autosave-file-buffer)
        (setq dotspacemacs-auto-save-file-location nil)

        (spacemacs/toggle-smooth-scrolling-off)

        (setq truncate-lines t)

        (require 'org-config)

        (remove-hook 'prog-mode-hook 'auto-complete-mode)
        (remove-hook 'prog-mode-hook 'rainbow-delimiters-mode)


        (menu-bar-mode -1)
        (tool-bar-mode -1)
        (scroll-bar-mode -1)

        ;; Defined in `helm-ag.el'.
        ;; Ignore patterns for `ag'. This parameters are specified as --ignore
        ;; (setq helm-ag-ignore-patterns nil)
        (setq helm-ag-use-grep-ignore-list t)
        ;; Use .agignore where is at project root if it exists.
        (setq helm-ag-use-agignore t)

        ;; (setq browse-url-browser-function 'browse-url-generic
        ;;       browse-url-generic-program "google-chrome")
        ;; (setq browse-url-browser-function 'browse-url-generic
        ;;       browse-url-generic-program "firefox")

        (setq browse-url-browser-function
              '(("^mailto:" . browse-url-mail)
                ("." . browse-url-firefox))
              )

        (setq browse-url-firefox-program "firefox")

        ;; defined in `grep.el'.
        (setq grep-find-ignored-directories
              '("target" ".ensime_cache"
                "SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" ;; defaults
                ))

        (setq grep-find-ignored-files
              '(".#*" "*.lock" "*.gen" "*.si" "*.cfs" "*.cfe" "*.hi" "*.o" "*~" "*.bin"
                "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo"
                "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem"
                "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl"
                "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl"
                "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl"
                "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux"
                "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns"
                "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo"
                ))



        (remove-hook 'js2-mode-hook 'skewer-mode)
        (remove-hook 'js2-mode-hook 'js2-imenu-extras-mode)

        (eval-after-load 'tern
             '(progn
                (require 'tern-auto-complete)
                (tern-ac-setup)))

        ;; (setq javascript-disable-tern-port-files t)

        (add-hook 'js2-mode-hook
                  (defun my-js2-mode-setup ()
                    ;; (require 'tern)
                    (flycheck-mode t)
                    (auto-complete-mode t)
                    (when (executable-find "eslint")
                      (flycheck-select-checker 'javascript-eslint))
                    ))

        (global-display-line-numbers-mode)

        (add-hook 'visual-line-mode-hook #'visual-fill-column-mode)
        (global-visual-fill-column-mode)
        ;; (setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
        (setq visual-line-fringe-indicators '(left-curly-arrow nil))

        ;; Warning (yasnippet): ‘Snippet’ modified buffer in a backquote expression.
        ;; To hide this warning, add (yasnippet backquote-change) to ‘warning-suppress-types’.
        (setq warning-suppress-types '(yasnippet backquote-change))


        )

    (progn
      (message "adamchandra/final-config *not* running, already ran")
      )
    )
  )


;; (evilified-state-evilify-map ein:notebooklist-mode-map

;; Overriding this function due to bug (error "Selecting deleted buffer") in with-current-buffer
(defun tide-dispatch-event (event)
  (-when-let (listener (gethash (tide-project-name) tide-event-listeners))
    (progn
      ;; (message (concat "curr buffer=" (prin1-to-string (car listener))))
      (if (buffer-live-p (car listener))
          (with-current-buffer (car listener)
            (apply (cdr listener) (list event)))))
    ))

(defun executable-find-prefer-node-modules (command)
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (cmd (and root
                      (expand-file-name
                       (concat "node_modules/.bin/" command)
                       root))))
    (when (and cmd (file-executable-p cmd))
      cmd)));;

(defun my/flycheck-executable-find (executable)
  "Resolve EXECUTABLE to a full path.
Like `executable-find', but supports relative paths.

Attempts invoking `executable-find' first; if that returns nil,
and EXECUTABLE contains a directory component, expands to a full
path and tries invoking `executable-find' again.
"
  ;; file-name-directory returns non-nil iff the given path has a
  ;; directory component.
  (or
   (executable-find-prefer-node-modules executable)
   (executable-find executable)
   (when (file-name-directory executable)
     (executable-find (expand-file-name executable))))
  )


;; (defun tst()
;;   (interactive)
;;   (progn
;;    (setq msg (my/flycheck-executable-find "tslint"))
;;    (message (concat "found: "  msg))
;;    )
;;   );

(setq flycheck-executable-find #'my/flycheck-executable-find)

;; (locate-file command exec-path exec-suffixes 1)
;; (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules);



;; (remove-hook 'flycheck-mode-hook 'flycheck-typescript-tslint-setup)
;; typescript-mode-hook (tide-setup eldoc-mode spacemacs//init-jump-handlers-typescript-mode setup-tide-mode)
(add-hook 'typescript-mode-hook #'setup-tide-mode-init)
(add-hook 'typescript-mode-hook #'setup-tide-mode t)
;; (remove-hook 'typescript-mode-hook 'prettier-js-mode)


(defun setup-tide-mode-init ()
  ;; (when (executable-find-prefer-node-modules "tslint")

  (setq tide-user-preferences
        '(
          ;;  If enabled, TypeScript will search through all external modules' exports and add them to the completions list.
          ;;  This affects lone identifier completions but not completions on the right hand side of `obj.`.
          :includeCompletionsForModuleExports t

          ;;  If enabled, the completion list will include completions with invalid identifier names.
          ;;  For those entries, The `insertText` and `replacementSpan` properties will be set to change from `.x` property access to `["x"]`.
          :includeCompletionsWithInsertText t

          :allowTextChangesInNewFiles t
          :disableSuggestions t
          :quotePreference "auto" ;;  "auto" | "double" | "single";

          ;; :importModuleSpecifierPreference "relative";; "relative" | "non-relative";
          ;; :allowTextChangesInNewFiles  t;; boolean;
          ;; :lazyConfiguredProjectsFromExternalProject?: boolean;
          ;; :providePrefixAndSuffixTextForRename?: boolean;
          ;; :allowRenameOfImportPath?: boolean;
        ))

  )

;; ;; override the default version to add some logging
;; (defun my/tide-flycheck-start (checker callback)
;;   (tide-command:geterr
;;    (lambda (response)
;;      (message (format "tide:geterr = %s" response))
;;      (when (tide-command-unknown-p response)
;;        (tide-tsserver-version-not-supported))
;;      (if (tide-response-success-p response)
;;          (tide-flycheck-send-response callback checker response)
;;        (funcall callback 'errored (plist-get response :message))))))
;;
;; (flycheck-define-generic-checker 'my/typescript-tide
;;   "A TypeScript syntax checker using tsserver."
;;   :start #'my/tide-flycheck-start
;;   :verify #'tide-flycheck-verify
;;   :modes '(typescript-mode)
;;   :predicate #'tide-flycheck-predicate)
;;
;; (setq 'flycheck-checkers (remq 'typescript-tide 'flycheck-checkers))
;; (add-to-list 'flycheck-checkers 'my/typescript-tide)
;; ;; (add-to-list 'flycheck-disabled-checkers 'typescript-tide)
;; (flycheck-add-next-checker 'my/typescript-tide '(warning . typescript-tslint) 'append)

(defun setup-tide-mode ()

  (interactive)

  (flycheck-mode +1)
  ;; (flycheck-select-checker 'my/typescript-tide)

  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1)

  (when (executable-find-prefer-node-modules "tslint")
    (flycheck-add-next-checker 'typescript-tide '(warning . typescript-tslint) 'append)
    )

  (when (executable-find-prefer-node-modules "eslint")
    (flycheck-add-next-checker 'typescript-tide '(warning . typescript-eslint) 'append)
    )

  ;; (when (executable-find-prefer-node-modules "eslint")
  ;;   (flycheck-select-checker 'typescript-eslint))

  (evil-leader/set-key
    "ee" 'tide-project-errors
    )

  (custom-set-variables
   '(js-indent-level 2)
   '(typescript-indent-level 2)
   '(tide-completion-detailed t)
   '(tide-completion-ignore-case t)
   )

  (evil-define-key 'normal tide-mode-map
    (kbd "M-.") 'tide-jump-to-definition
    )

  (evil-define-key 'normal tide-project-errors-mode-map
    (kbd "RET") 'tide-goto-error
    )

  (defun tide-dispatch-event (event)
    (-when-let (listener (gethash (tide-project-name) tide-event-listeners))
      (progn
        (if (buffer-live-p (car listener))
            (with-current-buffer (car listener)
              (apply (cdr listener) (list event)))))
      ))
  ) ;;



(setq auto-revert-verbose nil)

;; Ignore modification-time-only changes in files, i.e. ones that
;; don't really change the contents.  This happens often with
;; switching between different VC buffers.

(defun update-buffer-modtime-if-byte-identical ()
  (let* ((size      (buffer-size))
         (byte-size (position-bytes size))
         (filename  buffer-file-name))
    (when (and byte-size (<= size 1000000))
      (let* ((attributes (file-attributes filename))
             (file-size  (nth 7 attributes)))
        (when (and file-size
                   (= file-size byte-size)
                   (string= (buffer-substring-no-properties 1 (1+ size))
                            (with-temp-buffer
                              (insert-file-contents filename)
                              (buffer-string))))
          (set-visited-file-modtime (nth 5 attributes))
          t)))))

(defun verify-visited-file-modtime--ignore-byte-identical (original &optional buffer)
  (or (funcall original buffer)
      (with-current-buffer buffer
        (update-buffer-modtime-if-byte-identical))))
(advice-add 'verify-visited-file-modtime :around #'verify-visited-file-modtime--ignore-byte-identical)

(defun ask-user-about-supersession-threat--ignore-byte-identical (original &rest arguments)
  (unless (update-buffer-modtime-if-byte-identical)
    (apply original arguments)))

(advice-add 'ask-user-about-supersession-threat :around #'ask-user-about-supersession-threat--ignore-byte-identical)

;; (require 'zmq)
;; (zmq-load)
;; (module-load zmq-module-file)
