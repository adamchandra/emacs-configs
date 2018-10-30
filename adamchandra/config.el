
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

        (global-linum-mode -1);
        (global-nlinum-mode 1);


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
                    (require 'tern)
                    (flycheck-mode t)
                    (auto-complete-mode t)
                    (when (executable-find "eslint")
                      (flycheck-select-checker 'javascript-eslint))
                    ))

        )


    ;; Warning (yasnippet): ‘Snippet’ modified buffer in a backquote expression.
    ;; To hide this warning, add (yasnippet backquote-change) to ‘warning-suppress-types’.
    (setq warning-suppress-types '(yasnippet backquote-change))

    (progn
      (message "adamchandra/final-config *not* running, already ran")
      )))

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


;; use local eslint from node_modules before global
;; http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint)))) ;;
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules);

(defun setup-tide-mode ()

  (interactive)
  ;; (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1)
  (when (executable-find "tslint")
    (flycheck-select-checker 'typescript-tslint))
  (evil-leader/set-key
    "ee" 'tide-project-errors
    )

  (custom-set-variables
   '(js-indent-level 2)
   '(typescript-indent-level 2)
   )

  ;; SPC             scroll-up-command
  ;; -               negative-argument
  ;; 0               digit-argument
  ;; <               beginning-of-buffer
  ;; >               end-of-buffer
  ;; ?               describe-mode
  ;; q               quit-window
  ;; DEL             scroll-down-command
  ;; S-SPC           scroll-down-command

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


;; (remove-hook 'flycheck-mode-hook 'flycheck-typescript-tslint-setup)
(add-hook 'typescript-mode-hook #'setup-tide-mode t)
(add-hook 'typescript-mode-hook 'prettier-js-mode t)

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
