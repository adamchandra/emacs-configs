
;; (defconst *orgfile-dir* (expand-file-name "~/projects/the-toolshed/emacsen/org-files/org-agenda/"))

;; (defconst *full-elisp-available* (not (null *emacs-root*)))
(defconst *home-emacs-support* (expand-file-name "~/emacs/"))
(defconst *emacs-root*
  (cond
   ((file-directory-p *home-emacs-support*) *home-emacs-support*)
   (t nil)))

;; (add-to-list 'auto-mode-alist '("\\.\\(scala\\|sbt\\|sc\\)$" . scala-mode))
;; (add-to-list 'auto-mode-alist '("\\.gp$"     . gnuplot-mode))
;; (add-to-list 'auto-mode-alist '("\\.ya?ml$"  . yaml-mode))
;; (add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
;; (add-to-list 'auto-mode-alist '("Cakefile"   . coffee-mode))
;; ;; significant whitespace mode
;; (add-to-list 'auto-mode-alist '("\\.styl$"   . sws-mode))
;; ;; sws for yaml-like property files
;; (add-to-list 'auto-mode-alist '("\\.(props?|properties)$"   . sws-mode))
;; (add-to-list 'auto-mode-alist '("\\.less$"   . less-css-mode))
;; (add-to-list 'auto-mode-alist '("\\.jade$"   . jade-mode))
;; (add-to-list 'auto-mode-alist '("\\.scaml$"  . jade-mode))
;; (add-to-list 'auto-mode-alist '("\\.js$"     . js2-mode))
;; ;;(add-to-list 'auto-mode-alist '("\\.js$"     . javascript-mode))
;; (add-to-list 'auto-mode-alist '("\\.md"      . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.\\(xml\\|xsl\\|mxml\\|rng\\|xhtml\\)\\'" . nxml-mode))


;;(load-theme 'darkburn t)
;; (setq commit-script "/home/saunders/projects/the-toolshed/emacsen/org-files/commit-repos")
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (git-gutter-mode -1)
;;             (git-gutter+-mode -1)
;;             (add-hook 'after-save-hook 'commit-after-save nil 'make-it-local)))
;; Commit hook for org-mode autosave (org mode indent view doesn't play well with git gutter/fringe mode)
(defun commit-after-save ()
  ;; (interactive)
  ;; (shell-command commit-script)
  ;; (git-gutter+-mode -1)
  )



(setq adamchandra-layer-path "~/projects/the-toolshed/emacsen/emacs-configs/adamchandra/packages.el")

(defun company-my-setup ()
  (when (boundp 'company-backends)
    (make-local-variable 'company-backends)
    ;; remove
    (setq company-backends (delete 'company-dabbrev company-backends))
    ;; add
    ;; (add-to-list 'company-backends 'company-dabbrev)
    ))

;; (remove-hook 'scala-mode-hook 'company-my-setup)
(add-hook 'scala-mode-hook 'company-my-setup t)

;; (defun adamchandra/pre-config ()
;;   (interactive)
;;   (progn
;;     (message "adamchandra/pre-config running")

;;     ))


(setq *adams-config-ran* nil)

(defun adamchandra/final-config ()
  (interactive)
  (if (not *adams-config-ran*)
      (progn
        (message "adamchandra/final-config running")
        (setq *adams-config-ran* t)
        ;; (adamchandra/init-scala-mode)

        ;; (require 'linum-relative)
        ;; (linum-relative-mode)
        ;; (global-linum-mode)
        (spacemacs/toggle-smooth-scrolling-off)

        ;; (global-auto-complete-mode -1)

        (set-default 'truncate-lines t)


        (remove-hook 'org-mode-hook 'auto-complete-mode)
        (remove-hook 'prog-mode-hook 'auto-complete-mode)
        (remove-hook 'prog-mode-hook 'rainbow-delimiters-mode)
        ;; (remove-hook 'prog-mode-hook 'smartparens-mode)
                                        ;(load-theme 'solarized t)
                                        ;(load-theme 'leuven-prime t)

        (setq-default dotspacemacs-default-font '("Source Code Pro"
                                                  :size 10
                                                  :weight normal
                                                  :width normal
                                                  :powerline-scale 1.1))

        (set-default-font dotspacemacs-default-font)
        (menu-bar-mode -1)
        (tool-bar-mode -1)
        (scroll-bar-mode -1)

        ;; Defined in `helm-ag.el'.
        ;; Ignore patterns for `ag'. This parameters are specified as --ignore
        ;; (setq helm-ag-ignore-patterns nil)
        (setq helm-ag-use-grep-ignore-list t)
        ;; Use .agignore where is at project root if it exists.
        (setq helm-ag-use-agignore t)

        (setq browse-url-browser-function 'browse-url-generic
              browse-url-generic-program "google-chrome")

;;;;;; defined in `grep.el'.
        (setq grep-find-ignored-directories
              '("target"
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
