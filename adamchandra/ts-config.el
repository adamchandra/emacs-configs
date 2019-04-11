
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
    :predicate (lambda ()
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
