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



(setq flycheck-executable-find #'my/flycheck-executable-find)

;; Error (use-package): flycheck/:config: :predicate
;;    (function (lambda nil (and (executable-find-prefer-node-modules "tslint") (flycheck-buffer-saved-p))))
;;      of syntax checker my/typescript-tslint  is not a function
(defun init-typescript-flychecker()

  (flycheck-define-checker my/typescript-tslint
    "Copied from flycheck.el
  Modified to not generate temp files.

  TypeScript style checker using TSLint.

  Note that this syntax checker is not used if
  `flycheck-typescript-tslint-config' is nil or refers to a
  non-existing file.

  See URL `https://github.com/palantir/tslint'."
    :command ("tslint" "--format" "json"
              (config-file "--config" flycheck-typescript-tslint-config)
              (option "--rules-dir" flycheck-typescript-tslint-rulesdir)
              (eval flycheck-tslint-args)
              source-original)

    :error-parser flycheck-parse-tslint
    :modes (typescript-mode)

    :predicate #'(lambda ()
                   (and
                    (executable-find-prefer-node-modules "tslint")
                    (flycheck-buffer-saved-p)
                    ))

    )

  ;; (when (executable-find-prefer-node-modules "tslint")
  (setf (flycheck-checker-get 'typescript-tide 'next-checkers) '())
  (flycheck-add-next-checker 'typescript-tide '(warning . my/typescript-tslint) 'append)

  ;; (when (executable-find-prefer-node-modules "eslint")

  )
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

(defun setup-tide-mode ()

  (interactive)

  (flycheck-mode +1)
  ;; (flycheck-select-checker 'my/typescript-tide)

  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1)

  ;; (cl-some (defun p(elem) (equal elem)) (flycheck-checker-get 'typescript-tide 'next-checkers))
  ;; (setf (flycheck-checker-get 'typescript-tide 'next-checkers)
  ;;       (append (flycheck-checker-get 'typescript-tide 'next-checkers) (list next)))

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

(add-hook 'typescript-mode-hook #'setup-tide-mode-init)
(add-hook 'typescript-mode-hook #'setup-tide-mode t)

(provide 'ts-config)
