
(defconst *orgfile-dir* (expand-file-name "~/projects/the-toolshed/emacsen/org-files/org-agenda/"))

;; (defconst *full-elisp-available* (not (null *emacs-root*)))
(defconst *home-emacs-support* (expand-file-name "~/emacs/"))
(defconst *emacs-root*
  (cond
   ((file-directory-p *home-emacs-support*) *home-emacs-support*)
   (t nil)))

(add-to-list 'auto-mode-alist '("\\.\\(scala\\|sbt\\|sc\\)$" . scala-mode))
(add-to-list 'auto-mode-alist '("\\.gp$"     . gnuplot-mode))
(add-to-list 'auto-mode-alist '("\\.ya?ml$"  . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile"   . coffee-mode))
;; significant whitespace mode
(add-to-list 'auto-mode-alist '("\\.styl$"   . sws-mode))
;; sws for yaml-like property files
(add-to-list 'auto-mode-alist '("\\.(props?|properties)$"   . sws-mode))
(add-to-list 'auto-mode-alist '("\\.less$"   . less-css-mode))
(add-to-list 'auto-mode-alist '("\\.jade$"   . jade-mode))
(add-to-list 'auto-mode-alist '("\\.scaml$"  . jade-mode))
(add-to-list 'auto-mode-alist '("\\.js$"     . js2-mode))
;;(add-to-list 'auto-mode-alist '("\\.js$"     . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.md"      . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.\\(xml\\|xsl\\|mxml\\|rng\\|xhtml\\)\\'" . nxml-mode))



;;(load-theme 'darkburn t)
;;(load-theme 'monokai t)
;;(load-theme 'hc-zenburn t)
;;(load-theme 'ample t)

(set-default 'truncate-lines t)

(setq commit-script "/home/saunders/projects/the-toolshed/emacsen/org-files/commit-repos")

(add-hook 'org-mode-hook
          (lambda ()
            (git-gutter-mode -1)
            (git-gutter+-mode -1)
            (add-hook 'after-save-hook 'commit-after-save nil 'make-it-local)))



(setq adamchandra-layer-path "~/projects/the-toolshed/emacsen/emacs-configs/adamchandra/packages.el")

 (defun adamchandra/final-config ()
   (interactive)
   (progn
     (message "adamchandra/final-config running")
     (global-auto-complete-mode -1)

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
     ))


(defun adamchandra/pre-config ()
  (interactive)
  (progn
    (message "adamchandra/pre-config running")
    ))



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


;;;;;;;; Defined in `helm-ag.el'.
;; Ignore patterns for `ag'. This parameters are specified as --ignore
(setq helm-ag-ignore-patterns t)
(setq helm-ag-use-grep-ignore-list t)
;; Use .agignore where is at project root if it exists.
(setq helm-ag-use-agignore t)
