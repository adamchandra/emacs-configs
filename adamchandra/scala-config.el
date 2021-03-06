
;; LSP :: You can configure this warning with the `lsp-enable-file-watchers' and `lsp-file-watch-threshold' variables

(defun acs-config-scala-mode ()
  (message "running acs-config-scala-mode")

  (add-hook 'scala-mode-hook 'turn-on-auto-revert-mode)

  ;; When a buffer is reverted, a message is generated.  This can be
  ;; suppressed by setting ‘auto-revert-verbose’ to nil.

  ;; Use ‘global-auto-revert-mode’ to automatically revert all buffers.
  ;; Use ‘auto-revert-tail-mode’ if you know that the file will only grow
  ;; without being changed in the part that is already in the buffer.

  ;; Automatically insert asterisk in a comment when enabled
  (defun scala/newline-and-indent-with-asterisk ()
    (interactive)
    (newline-and-indent)
    (when scala-auto-insert-asterisk-in-comments
      (scala-indent:insert-asterisk-on-multiline-comment)))

  (evil-define-key 'insert scala-mode-map
    (kbd "RET") 'scala/newline-and-indent-with-asterisk)

  (evil-define-key 'normal scala-mode-map "J" 'spacemacs/scala-join-line)

  ;; (lsp-file-watch-ignored)

  ;; (evil-leader/set-key
  (spacemacs/set-leader-keys-for-major-mode 'scala-mode
    "ee" 'lsp-ui-flycheck-list          ;; e+ errors
    "fb" 'lsp-format-buffer            ;; e+ Format buffer
    "fr"  'lsp-format-region           ;; Format region or line
    "gd"  'lsp-find-declaration        ;; Goto declarations of symbol under point
    "gf"  'lsp-find-definition         ;; Goto definitions of symbol
    "gi"  'lsp-find-implementation     ;; Goto implementations of symbol under point
    "gr"  'lsp-find-references         ;; Goto references to symbol under point
    "gt"  'lsp-find-type-definition    ;; Goto type definitions of symbol under point

    "esl"  'lsp-switch-to-io-log-buffer ;; Switch to log View IO logs for workspace
    "etl"  'lsp-lens-mode               ;; Toggle Code Lenses
    "etd"  'lsp-describe-thing-at-point ;; Describe thing at point
    ;; "e"  'lsp-execute-code-action     ;; Execute code action
    ;; "e"  'lsp-document-highlight      ;; Highlight references to symbol under point
    ;; "e"  'lsp-rename                  ;; Rename symbol under point
    ;; "e"  'lsp-shutdown-workspace      ;; Shutdown language server
    "udd"  'lsp-ui-doc-show
    "upr"  'lsp-ui-peek-find-references
    "upd"  'lsp-ui-peek-find-definitions

    "exs"  'lsp-restart-workspace       ;; Execute (Restart) language server
    "md"  'lsp-metals-doctor-run       ;; Execute Doctor
    "mt"  'lsp-metals-treeview         ;; Switch to treeview
    "mbi" 'lsp-metals-build-import  ;; Unconditionally run `sbt bloopInstall` and re-connect to the build server."
    "mbc" 'lsp-metals-build-connect ;; Unconditionally cancel existing build server connection and re-connect."
    "mbs" 'lsp-metals-bsp-switch  ;; Interactively switch between BSP servers.
    "mss" 'lsp-metals-sources-scan  ;; Walk all files in the workspace and index where symbols are defined."
    "mrc" 'lsp-metals-reset-choice  ;; Reset a decision you made about different settings. E.g. If you choose to import workspace with sbt you can decide to reset and change it again."
    )
  ;; lsp-find-definition
  (evil-define-key 'normal scala-mode-map
    (kbd "M-.") 'lsp-find-definition
    )

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


  (setq lsp-ui-sideline-enable t                ;;   "Whether or not to enable ‘lsp-ui-sideline’."
        ;; lsp-ui-sideline-ignore-duplicate nil    ;;   "Control to ignore duplicates when there is a same symbol with the same contents."
        ;; lsp-ui-sideline-show-symbol t           ;;   "When t, show the symbol name on the right of the information."
        ;; lsp-ui-sideline-show-hover t            ;;   "Whether to show hover messages in sideline."
        ;; lsp-ui-sideline-show-diagnostics t      ;;   "Whether to show diagnostics messages in sideline."
        ;; lsp-ui-sideline-show-code-actions t     ;;   "Whether to show code actions in sideline."
        ;; lsp-ui-sideline-update-mode 'line       ;;   "Define the mode for updating sideline information.
        ;; lsp-ui-sideline-delay 0.2               ;;   "Number of seconds to wait before showing sideline."
        ;; lsp-ui-sideline-diagnostic-max-lines 20 ;;   "Maximum number of lines to show of diagnostics in sideline."
        );

  (setq lsp-ui-doc-enable t              ;;   "Whether or not to enable lsp-ui-doc."
        lsp-ui-doc-header nil            ;;   "Whether or not to enable the header which display the symbol string."
        lsp-ui-doc-include-signature t   ;;   "Whether or not to include the object signature/type in the frame."
        lsp-ui-doc-position 'at-point      ;;   "Where to display the doc. top|bottom|at-point
        lsp-ui-doc-border "blue"        ;;   "Border color of the frame."
        lsp-ui-doc-max-width 150         ;;   "Maximum number of columns of the frame."
        lsp-ui-doc-max-height 30         ;;   "Maximum number of lines in the frame."
        lsp-ui-doc-use-childframe t      ;;   "Whether to display documentation in a child-frame or the current frame.
        lsp-ui-doc-use-webkit t        ;;   "Whether to display documentation in a WebKit widget in a child-frame.
        lsp-ui-doc-delay 1.0             ;;   "Number of seconds before showing the doc."
        )

  (setq lsp-ui-flycheck-enable t            ;;   "Whether or not to enable ‘lsp-ui-flycheck’."
        lsp-ui-flycheck-live-reporting t      ;;   "If non-nil, diagnostics in buffer will be reported as soon as possible.
        lsp-ui-flycheck-list-position 'bottom ;;   "Position where `lsp-ui-flycheck-list' will show diagnostics for the whole workspace. (bottom|right)
        )

  (setq lsp-ui-imenu-enable nil
        lsp-ui-imenu-kind-position 'top                 ;;   "Where to show the entries kind."
        lsp-ui-imenu-colors '("deep sky blue" "green3") ;;   "Color list to cycle through for entry groups."
        )

  (setq lsp-ui-peek-enable t           ;;   "Whether or not to enable ‘lsp-ui-peek’."
        lsp-ui-peek-peek-height 20     ;;   "Height of the peek code."
        lsp-ui-peek-list-width 50      ;;   "Width of the right panel."
        lsp-ui-peek-fontify 'on-demand ;;   "Whether to fontify chunks of code (use semantics colors).
        lsp-ui-peek-always-show nil    ;;   "Show the peek view even if there is only 1 cross reference.
        )

  )

(provide 'scala-config)
