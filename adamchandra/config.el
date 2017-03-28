(defconst *orgfile-dir* (expand-file-name "~/projects/the-toolshed/emacsen/org-files/orgs/"))

(defconst *home-emacs-support* (expand-file-name "~/emacs/"))
(defconst *emacs-root*
  (cond
   ((file-directory-p *home-emacs-support*) *home-emacs-support*)
   (t nil)))


;; (load-theme 'darkburn t)
;; (setq commit-script "/home/saunders/projects/the-toolshed/emacsen/org-files/commit-repos")
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (git-gutter-mode -1)
;;             (git-gutter+-mode -1)
;;             (add-hook 'after-save-hook 'commit-after-save nil 'make-it-local)))
;; Commit hook for org-mode autosave (org mode indent view doesn't play well with git gutter/fringe mode)


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
  (setq auto-save-buffers-enhanced-activity-flag nil))

(defun enable-autosave ()
  (setq auto-save-buffers-enhanced-activity-flag t))

(defun adamchandra/final-config ()
  (interactive)
  (if (not *adams-config-ran*)
      (progn
        (message "adamchandra/final-config running")
        (setq *adams-config-ran* t)

        (setq *acs-layer-path*  (configuration-layer/get-layer-path 'adamchandra))
        (push *acs-layer-path* load-path)
        (setq *theme-path* (concat *acs-layer-path*  "extensions/leuven-prime-theme/leuven-prime-theme.el"))


        (adamchandra/init-scala-mode)

        (spacemacs/set-leader-keys
          "bk" 'spacemacs/kill-this-buffer
          )


        (setq ensime-save-before-compile t)
        (setq ensime-typecheck-idle-interval 0.5)
        (setq ensime-typecheck-interval 2.0)
        (setq ensime-typecheck-when-idle t)
        (setq ensime-startup-snapshot-notification nil)
        (setq ensime-startup-notification nil)
        (setq ensime-tooltip-hints t)
        (setq ensime-type-tooltip-hints t)

        (add-hook 'evil-insert-state-entry-hook 'disable-autosave)
        (add-hook 'evil-insert-state-exit-hook 'enable-autosave)
        ;; (add-hook 'evil-insert-state-exit-hook 'autosave-file-buffer)
        (setq dotspacemacs-auto-save-file-location 'cache)

        (require 'linum-relative)
        (global-linum-mode)
        (spacemacs/toggle-smooth-scrolling-off)

        (setq truncate-lines t)

        (remove-hook 'org-mode-hook 'auto-complete-mode)
        (remove-hook 'prog-mode-hook 'auto-complete-mode)
        (remove-hook 'prog-mode-hook 'rainbow-delimiters-mode)

        ;; (remove-hook 'prog-mode-hook 'smartparens-mode)
                                        ;(load-theme 'solarized t)
                                        ;(load-theme 'leuven-prime t)

        (require 'org-config)

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
        (setq browse-url-browser-function 'browse-url-generic
              browse-url-generic-program "firefox")

        ;; defined in `grep.el'.
        (setq grep-find-ignored-directories
              '("target" ".ensime*"
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

        )
    (progn
      (message "adamchandra/final-config *not* running, already ran")
      )))


;; (adamchandra/final-config)
