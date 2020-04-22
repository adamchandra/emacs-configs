
(defun executable-find-prefer-node-modules (command)
  (interactive)
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (cmd (and root
                   (expand-file-name
                    (concat "node_modules/.bin/" command)
                    root))))
    (when (and cmd (file-executable-p cmd))
      cmd)
    )
  );;

(defun find-eslint-config ()
  "
"
  (interactive)
  (let* (
         (config-file ".eslintrc.js")
         (config-file-alt ".eslintrc.emacs.js")
         (root-norm (locate-dominating-file
                     (or (buffer-file-name) default-directory)
                     config-file))
         (root-alt (locate-dominating-file
                    (or (buffer-file-name) default-directory)
                    config-file-alt))
         (config (if root-alt
                     (expand-file-name config-file-alt root-alt)
                   (expand-file-name config-file root-norm)
                   ))
         )
    (message (concat "found config:" config))
    config
    ));

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

(setq flycheck-executable-find #'my/flycheck-executable-find)

(setq typescript-linter 'eslint)

(defun my-web-mode-hook ()
  (smartparens-mode +1)
  )

(defun my-tide-setup-hook ()
  (tide-setup)
  (eldoc-mode)
  (tide-hl-identifier-mode +1)
  (smartparens-mode +1)

  (setq web-mode-enable-auto-quoting nil)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-attr-indent-offset 2)
  (setq web-mode-attr-value-indent-offset 2)
  (set (make-local-variable 'company-backends)
       '((company-tide company-files)
         (company-dabbrev-code company-dabbrev)))


  (flycheck-add-mode 'typescript-tslint 'web-mode)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))

  (setq tide-tsserver-executable (executable-find-prefer-node-modules "tsserver"))

  ;; (setq tide-tsserver-process-environment ) ;; is a variable defined in ‘tide.el’.

  (setq tide-tsserver-process-environment '("TSS_LOG=-level verbose -file /tmp/tsserver.log"))
  ;; (setq tide-tsserver-process-environment '())

  ;; (setq flycheck-eslint-args '("--config" ".eslintrc.emacs.js"))
  ;; (setq flycheck-eslint-args '("--no-eslintrc" "--config=./.eslintrc.emacs.js"))
  ;; (setq flycheck-eslint-args '("--no-eslintrc" (concat "--config=" (find-eslint-config))))
  (setq flycheck-eslint-args `("--no-eslintrc" ,(concat "--config=" (find-eslint-config))))

  (custom-set-variables
   '(js-indent-level 2)
   '(typescript-indent-level 2)
   '(tide-completion-detailed t)
   '(tide-completion-ignore-case t)
   )

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

  (evil-define-key
    '(normal) local
   :prefix ", ."
   )

  (spacemacs/set-leader-keys-for-major-mode 'typescript-mode
    "xR" 'tide-restart-server

    "gd" 'tide-documentation-at-point
    "gr" 'tide-references

    "es" 'tide-error-at-point
    "ee" 'tide-project-errors
    "ei" 'tide-add-tslint-disable-next-line
    "en" 'flycheck-next-error
    "ep" 'flycheck-previous-error
    "ef" 'tide-fix

    "rr" 'tide-rename-symbol
    "rF" 'tide-refactor
    "rp" 'tide-format
    "rP" 'prettier-js
    "rf" 'tide-rename-file
    "ri" 'tide-organize-imports
    )

  (spacemacs/set-leader-keys-for-major-mode 'web-mode
    "xR" 'tide-restart-server

    "gd" 'tide-documentation-at-point
    "gr" 'tide-references

    "es" 'tide-error-at-point
    "ee" 'tide-project-errors
    "ei" 'tide-add-tslint-disable-next-line
    "en" 'flycheck-next-error
    "ep" 'flycheck-previous-error
    "ef" 'tide-fix

    "rr" 'tide-rename-symbol
    "rF" 'tide-refactor
    "rp" 'tide-format
    "rP" 'prettier-js
    "rf" 'tide-rename-file
    "ri" 'tide-organize-imports
    )

  (evil-define-key 'normal tide-mode-map
    (kbd "M-.") 'tide-jump-to-definition
    )

  (evil-define-key 'normal tide-project-errors-mode-map
    (kbd "RET") 'tide-goto-error
    )

  ;; Overriding this function due to bug (error "Selecting deleted buffer") in with-current-buffer
  (defun tide-dispatch-event (event)
    (-when-let (listener (gethash (tide-project-name) tide-event-listeners))
      (progn
        (if (buffer-live-p (car listener))
            (with-current-buffer (car listener)
              (apply (cdr listener) (list event)))))
      ))
  )

(use-package prettier-js
  :defer t)

(use-package tide
  :defer t)

(use-package web-mode
  :mode (("\\.tsx$" . web-mode))
  :init
  (add-hook 'web-mode-hook 'company-mode)
  (add-hook 'web-mode-hook
            (lambda () (pcase (file-name-extension buffer-file-name)
                         ("tsx" (my-tide-setup-hook))
                         (_ (my-web-mode-hook)))
              )))

(use-package typescript-mode
  :mode (("\\.ts$" . typescript-mode))
  :init
  (add-hook 'typescript-mode-hook 'my-tide-setup-hook t)
  (add-hook 'typescript-mode-hook 'company-mode)
  )

(defun switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "Minibuffer is not active")))

(provide 'ts-config)
