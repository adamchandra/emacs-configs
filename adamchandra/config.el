
(defconst *home-emacs-support* (expand-file-name "~/emacs/"))

(defconst *emacs-root*
  (cond
   ((file-directory-p *home-emacs-support*) *home-emacs-support*)
   (t nil)))


(defconst *acs-layer-path*  (configuration-layer/get-layer-path 'adamchandra))
(push *acs-layer-path* load-path)
(defconst *themes* (concat *acs-layer-path*  "themes"))
;; (defconst *theme-path* (concat *acs-layer-path*  "extensions/leuven-prime-theme/leuven-solar-theme.el"))

(add-to-list 'custom-theme-load-path *themes*)

(setq *adams-config-ran* nil)
(setq dotspacemacs-helm-use-fuzzy nil)

(defun enhanced-save-buffer ()
  (interactive)
  (progn
    (delete-trailing-whitespace)
    ;; (pcase (file-name-extension buffer-file-name)
    ;;               ("ts" (if (fboundp 'prettier-js) (prettier-js)))
    ;;               ("tsx" (if (fboundp 'prettier-js) (prettier-js)))
    ;;               (_ ()))
    (save-buffer)
    ))


(defun disable-autosave ()
  (progn
    (setq auto-save-buffers-enhanced-activity-flag nil)
    ))

(defun enable-autosave ()
  (progn
    (setq auto-save-buffers-enhanced-activity-flag t)
    ))

(defun my-dired-config()
  (interactive)
  (require 'dired-x)
  (dired-hide-details-mode 1)
  (setq dired-hide-details-hide-symlink-targets nil)
  (evil-define-key 'normal dired-mode-map
    "i" 'dired-subtree-insert
    "t" 'dired-subtree-toggle
    (kbd "TAB") 'dired-subtree-cycle

    ;; "F" 'dired-subtree-apply-filter

    ;; "" 'dired-subtree-remove
    ;; "" 'dired-subtree-revert
    ;; "" 'dired-subtree-narrow
    ;; "" 'dired-subtree-up
    ;; "" 'dired-subtree-down
    ;; "" 'dired-subtree-next-sibling
    ;; "" 'dired-subtree-previous-sibling
    ;; "" 'dired-subtree-beginning
    ;; "" 'dired-subtree-end
    ;; "" 'dired-subtree-mark-subtree
    ;; "" 'dired-subtree-unmark-subtree
    ;; "" 'dired-subtree-only-this-file
    ;; "" 'dired-subtree-only-this-directory
    ;; "" 'dired-subtree-apply-filter
    )
  );


;; (defun reload-my-theme()
;;   (interactive)
;;   (load-file *theme-path*)
;;   (load-theme 'leuven-solar t);
;;   )


(defun my-markdown-live-preview-window-eww (file)
  "Preview FILE with eww.
To be used with `markdown-live-preview-window-function'."

  (interactive)

  (message "my-markdown-live-preview-window-eww")
  (if (bufferp "*eww*")
        (kill-buffer "*eww*")
        )
  (message "my-markdown-live-preview-window-eww: maybe killed")
  (eww-open-file file)
  (message "my-markdown-live-preview-window-eww: get-buffer")
  (get-buffer "*eww*")
  )

(defun config-markdown-mode()
  (interactive)
  (setq
   ;; markdown-command
   ;; markdown-command-needs-filename nil
   ;; markdown-open-command nil
   ;; markdown-open-image-command nil
   ;; markdown-hr-strings
   ;; markdown-bold-underscore nil
   ;; markdown-italic-underscore nil
   ;; markdown-marginalize-headers nil
   ;; markdown-marginalize-headers-margin-width 6
   ;; markdown-asymmetric-header nil
   ;; markdown-indent-function 'markdown-indent-line
   ;; markdown-indent-on-enter t
   ;; markdown-enable-wiki-links nil
   ;; markdown-wiki-link-alias-first t
   ;; markdown-wiki-link-search-subdirectories nil
   ;; markdown-wiki-link-search-parent-directories nil
   ;; markdown-wiki-link-fontify-missing nil
   ;; markdown-uri-types
   ;; markdown-url-compose-char
   ;; markdown-blockquote-display-char
   ;; markdown-hr-display-char
   ;; markdown-definition-display-char
   ;; markdown-enable-math nil
   ;; markdown-enable-html t
   ;; markdown-css-paths nil
   ;; markdown-content-type "text/html"
   ;; markdown-coding-system nil
   ;; markdown-export-kill-buffer t
   ;; markdown-xhtml-header-content ""
   ;; markdown-xhtml-body-preamble ""
   ;; markdown-xhtml-body-epilogue ""
   ;; markdown-xhtml-standalone-regexp
   ;; markdown-link-space-sub-char "_"
   ;; markdown-reference-location 'header
   ;; markdown-footnote-location 'end
   ;; markdown-footnote-display '((raise 0.2) (height 0.8))
   ;; markdown-sub-superscript-display
   ;; markdown-unordered-list-item-prefix "  * "
   ;; markdown-nested-imenu-heading-index t
   ;; markdown-add-footnotes-to-imenu t
   ;; markdown-make-gfm-checkboxes-buttons t
   ;; markdown-use-pandoc-style-yaml-metadata nil
   ;; markdown-split-window-direction 'any
   markdown-live-preview-window-function 'my-markdown-live-preview-window-eww
   markdown-live-preview-delete-export 'delete-on-export
   ;; markdown-list-indent-width 4
   ;; markdown-enable-prefix-prompts t
   ;; markdown-gfm-additional-languages nil
   ;; markdown-gfm-use-electric-backquote t
   ;; markdown-gfm-downcase-languages t
   ;; markdown-edit-code-block-default-mode 'normal-mode
   ;; markdown-gfm-uppercase-checkbox nil
   ;; markdown-hide-urls nil
   ;; markdown-translate-filename-function #'identity
   ;; markdown-max-image-size nil
   ;; markdown-mouse-follow-link t
   ;; markdown-hide-markup nil
   ;; markdown-header-scaling nil
   ;; markdown-header-scaling-values
   ;; markdown-list-item-bullets
   ;; markdown-spaces-after-code-fence 1
   ;; markdown-display-remote-images nil
   ;; markdown-remote-image-protocols '("https")
   ;; markdown-fontify-code-blocks-natively nil
   ;; markdown-fontify-code-block-default-mode nil
   ;; markdown-code-lang-modes
   ;; markdown-hide-markup-in-view-modes t
   )
  )

(defun adamchandra/final-config ()
  (interactive)
  (if (not *adams-config-ran*)
      (progn
        (message "adamchandra/final-config running")
        (setq *adams-config-ran* t)

        (add-hook 'dired-mode-hook #'my-dired-config)

        (require 'org-config)
        (require 'ts-config)
        (require 'translate-funcs)
        (require 'livedown)

        (config-markdown-mode)

        ;; prevent .#filname.xx files (which cause a problem w/ensime)
        (setq create-lockfiles nil)

        (spacemacs/set-leader-keys
          "bk" 'spacemacs/kill-this-buffer
          )


        (add-hook 'evil-insert-state-entry-hook 'disable-autosave)
        (add-hook 'evil-insert-state-exit-hook 'enable-autosave)
        ;; (add-hook 'evil-insert-state-exit-hook 'autosave-file-buffer)
        (setq dotspacemacs-auto-save-file-location nil)

        (setq history-delete-duplicates t)

        (spacemacs/toggle-smooth-scrolling-off)

        (setq truncate-lines t)

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
        (spacemacs/toggle-smartparens-globally-on)
        (show-smartparens-global-mode)

        (global-auto-revert-mode)
        (setq auto-revert-verbose t)

        ;; (add-hook 'visual-line-mode-hook #'visual-fill-column-mode)
        ;; (global-visual-fill-column-mode)

        (fringe-mode '(24 . 14))
        (setq visual-line-fringe-indicators '(left-curly-arrow nil))

        ;; Warning (yasnippet): ‘Snippet’ modified buffer in a backquote expression.
        ;; To hide this warning, add (yasnippet backquote-change) to ‘warning-suppress-types’.
        (setq warning-suppress-types '(yasnippet backquote-change))

        (setq bookmark-default-file "~/.emacs.d/bookmarks")  ;;define file to use.
        (setq bookmark-save-flag 1)  ;save bookmarks to .emacs.bmk after each entry

        (message "adamchandra/final-config (done) running")

        )

    (progn
      (message "adamchandra/final-config *not* running, already ran")
      )
    )
  )


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



;; from https://www.reddit.com/r/emacs/comments/8xobt3/tip_in_modeline_show_buffer_file_path_relative_to/
(with-eval-after-load 'subr-x
  (setq-default
   mode-line-buffer-identification
   '(:eval (format-mode-line
            (propertized-buffer-identification
             (or (when-let* ((buffer-file-truename buffer-file-truename)
                             (prj (cdr-safe (project-current)))
                             (prj-parent (file-name-directory (directory-file-name (expand-file-name prj)))))
                   (concat (file-relative-name (file-name-directory buffer-file-truename) prj-parent) (file-name-nondirectory buffer-file-truename)))
                 "%b")
             )))))
