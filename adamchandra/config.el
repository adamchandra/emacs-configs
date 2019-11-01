
(defconst *home-emacs-support* (expand-file-name "~/emacs/"))

(defconst *emacs-root*
  (cond
   ((file-directory-p *home-emacs-support*) *home-emacs-support*)
   (t nil)))


(defconst *acs-layer-path*  (configuration-layer/get-layer-path 'adamchandra))
(push *acs-layer-path* load-path)
(defconst *theme-path* (concat *acs-layer-path*  "extensions/leuven-prime-theme/leuven-prime-theme.el"))

(setq *adams-config-ran* nil)
(setq dotspacemacs-helm-use-fuzzy nil)

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

        (require 'org-config)
        (require 'scala-config)
        (require 'ts-config)
        (require 'translate-funcs)

        ;; prevent .#filname.xx files (which cause a problem w/ensime)
        (setq create-lockfiles nil)

        (adamchandra/init-scala-mode)

        (spacemacs/set-leader-keys
          "bk" 'spacemacs/kill-this-buffer
          "gi" 'sync-intellij
          )



        (add-hook 'evil-insert-state-entry-hook 'disable-autosave)
        (add-hook 'evil-insert-state-exit-hook 'enable-autosave)
        ;; (add-hook 'evil-insert-state-exit-hook 'autosave-file-buffer)
        (setq dotspacemacs-auto-save-file-location nil)

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
