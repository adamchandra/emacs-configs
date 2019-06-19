
(defun adamchandra/init-scala-mode ()
  (use-package scala-mode
    :defer t
    :mode "\\.s\\(cala\\|bt\\)$"
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

      (evil-define-key 'normal scala-mode-map
        (kbd "M-.") 'evil-goto-definition
        )

      (progn

        (setq lsp-ui-sideline-enable nil                ;;   "Whether or not to enable ‘lsp-ui-sideline’."
              lsp-ui-sideline-ignore-duplicate nil    ;;   "Control to ignore duplicates when there is a same symbol with the same contents."
              lsp-ui-sideline-show-symbol t           ;;   "When t, show the symbol name on the right of the information."
              lsp-ui-sideline-show-hover t            ;;   "Whether to show hover messages in sideline."
              lsp-ui-sideline-show-diagnostics t      ;;   "Whether to show diagnostics messages in sideline."
              lsp-ui-sideline-show-code-actions t     ;;   "Whether to show code actions in sideline."
              lsp-ui-sideline-update-mode 'line       ;;   "Define the mode for updating sideline information.
              lsp-ui-sideline-delay 0.2               ;;   "Number of seconds to wait before showing sideline."
              lsp-ui-sideline-diagnostic-max-lines 20 ;;   "Maximum number of lines to show of diagnostics in sideline."
              )

        (setq lsp-ui-doc-enable t              ;;   "Whether or not to enable lsp-ui-doc."
              lsp-ui-doc-header nil            ;;   "Whether or not to enable the header which display the symbol string."
              lsp-ui-doc-include-signature t   ;;   "Whether or not to include the object signature/type in the frame."
              lsp-ui-doc-position 'at-point      ;;   "Where to display the doc. top|bottom|at-point
              lsp-ui-doc-border "blue"        ;;   "Border color of the frame."
              lsp-ui-doc-max-width 150         ;;   "Maximum number of columns of the frame."
              lsp-ui-doc-max-height 30         ;;   "Maximum number of lines in the frame."
              lsp-ui-doc-use-childframe t      ;;   "Whether to display documentation in a child-frame or the current frame.
              lsp-ui-doc-use-webkit t        ;;   "Whether to display documentation in a WebKit widget in a child-frame.
              lsp-ui-doc-delay 0.2             ;;   "Number of seconds before showing the doc."
              )

        (setq lsp-ui-flycheck-enable t            ;;   "Whether or not to enable ‘lsp-ui-flycheck’."
              lsp-ui-flycheck-live-reporting t      ;;   "If non-nil, diagnostics in buffer will be reported as soon as possible.
              lsp-ui-flycheck-list-position 'right ;;   "Position where `lsp-ui-flycheck-list' will show diagnostics for the whole workspace. (bottom|right)
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

      )
    ))

(provide 'scala-config)


;; (defun company-my-setup ()
;;   (when (boundp 'company-backends)
;;     (make-local-variable 'company-backends)

;;     ;; remove
;;     ;; (setq company-backends (delete 'company-dabbrev company-backends))

;;     (setq company-backends '(
;;                              ensime-company
;;                              ;; company-bbdb
;;                              ;; company-nxml
;;                              ;; company-css
;;                              ;; company-eclim
;;                              ;; company-semantic
;;                              ;; company-clang
;;                              ;; company-xcode
;;                              ;; company-cmake
;;                              ;; company-capf
;;                              ;; company-files
;;                              ;; (company-dabbrev-code company-gtags company-etags company-keywords)
;;                              ;; company-oddmuse
;;                              ))

;;     ))

;; (remove-hook 'scala-mode-hook 'company-my-setup)
;; (add-hook 'scala-mode-hook 'company-my-setup t)

;; ;; Automatically replace arrows with unicode ones when enabled
;; (defconst scala-unicode-arrows-alist
;;   '(("=>" . "⇒")
;;     ("->" . "→")
;;     ("<-" . "←")))

;;       (defun scala/replace-arrow-at-point ()
;;         "Replace the arrow before the point (if any) with unicode ones.
;; An undo boundary is inserted before doing the replacement so that
;; it can be undone."
;;         (let* ((end (point))
;;                (start (max (- end 2) (point-min)))
;;                (x (buffer-substring start end))
;;                (arrow (assoc x scala-unicode-arrows-alist)))
;;           (when arrow
;;             (undo-boundary)
;;             (backward-delete-char 2)
;;             (insert (cdr arrow)))))

;;       (defun scala/gt ()
;;         "Insert a `>' to the buffer. If it's part of a right arrow (`->' or `=>'),
;; replace it with the corresponding unicode arrow."
;;         (interactive)
;;         (insert ">")
;;         (scala/replace-arrow-at-point))

;;       (defun scala/hyphen ()
;;         "Insert a `-' to the buffer. If it's part of a left arrow (`<-'),
;; replace it with the unicode arrow."
;;         (interactive)
;;         (insert "-")
;;         (scala/replace-arrow-at-point))

      ;; (when scala-use-unicode-arrows
      ;;   (define-key scala-mode-map
      ;;     (kbd ">") 'scala/gt)
      ;;   (define-key scala-mode-map
      ;;     (kbd "-") 'scala/hyphen))
