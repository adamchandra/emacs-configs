(defvar adamchandra-packages
  '(
    ;; package adamchandras go here
    deft
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar adamchandra-excluded-packages '()
  "List of packages to exclude.")


(eval-when-compile
  (require 'cl))


(defconst *orgfile-dir* (expand-file-name "~/projects/the-toolshed/emacsen/org-files/org-agenda/"))


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


;(load-theme 'monokai t)
(load-theme 'ample t)
;(load-theme 'zenburn t)


(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))


;; (defconst *full-elisp-available* (not (null *emacs-root*)))
(defconst *home-emacs-support* (expand-file-name "~/emacs/"))
(defconst *emacs-root*
  (cond
   ((file-directory-p *home-emacs-support*) *home-emacs-support*)
   (t nil)))

(defun adamchandra/init-deft ()
  "Initialize deft"
  (use-package deft
    :defer t
    :init
    (evil-leader/set-key
      "fo" 'deft
      )
    (setq deft-directory (expand-file-name "~/projects/the-toolshed/emacsen/org-files/emacs-deft/")))
  
  (setq deft-extension "org")
  (setq deft-text-mode 'org-mode)
 ) 

(evil-leader/set-key "e" nil)



(defun adamchandra/init-scala-mode ()
  (interactive)
  "Initialize scala" 
  (use-package scala-mode
    :defer t
    :init
    (require 'ensime)
    (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
    (auto-fill-mode -1)
    ;;(add-hook 'scala-mode-hook 'scala-mode-hook-cb)


    (setq spacemacs/key-binding-prefixes '(
                                           ("e" .  "ensime")
                                           ("er" .  "ensime refactor")
                                           ("es" .  "ensime search/show")
                                       ))
    
    (evil-leader/set-key-for-mode 'scala-mode 
      "eit" 'ensime-inspect-type-at-point           ;; "C-v i"
      "eip" 'ensime-inspect-package-at-point        ;; "C-v p"
      ;o;"ei" 'ensime-inspect-project-package         ;; "C-v o"
      "ess" 'ensime-show-uses-of-symbol-at-point    ;; "C-v r"
      "esa" 'ensime-search                          ;; "C-v v"
      "esx" 'ensime-scalex                          ;; "C-v x"
      "esd" 'ensime-show-doc-for-symbol-at-point    ;; "C-v d"
      "ecf" 'ensime-typecheck-current-file          ;; "C-c c"
      "eca" 'ensime-typecheck-all                   ;; "C-c a"
      "egf" 'ensime-reload-open-files               ;; "C-c r"
      "ese" 'ensime-show-all-errors-and-warnings    ;; "C-c e"
      "err" 'ensime-refactor-rename                 ;; "C-r r"
      "ero" 'ensime-refactor-organize-imports       ;; "C-r o"
      "erl" 'ensime-refactor-extract-local          ;; "C-r l"
      "erm" 'ensime-refactor-extract-method         ;; "C-r m"
      ;o;"er" 'ensime-refactor-inline-local           ;; "C-r i"
      "eri" 'ensime-import-type-at-point            ;; "C-r t"
      "e." 'ensime-edit-definition                 ;; "M-."
      "e," 'ensime-pop-find-definition-stack       ;; "M-,"
      "enn" 'ensime-forward-note                    ;; "M-n"
      "oepn" 'ensime-backward-note                   ;; "M-p"
      )
    )
  )


;;"e" 'ensime-sbt-switch                      ;; "C-v s"
;;"e" 'ensime-inf-switch                      ;; "C-v z"
;;"e" 'ensime-format-source                   ;; "C-v f"
;;"e" 'ensime-undo-peek                       ;; "C-v u"
;;"e" 'ensime-print-type-at-point             ;; "C-v t"
;;"e" 'ensime-print-errors-at-point           ;; "C-v e"
;; "e" 'ensime-expand-selection-command        ;; "C-v ."
;; "e" 'ensime-inf-eval-region               "C;; -v C-r"
;; "e" 'ensime-inf-eval-buffer                 ;; "C-v b"
;; "e" 'ensime-inf-load-file                   ;; "C-v l"
;; "e" 'ensime-goto-test                       ;; "C-t t"
;; "e" 'ensime-goto-impl                       ;; "C-t i"
;; "e" 'ensime-db-start                        ;; "C-d d"
;; "e" 'ensime-db-set-break                    ;; "C-d b"
;; "e" 'ensime-db-clear-break                  ;; "C-d u"
;; "e" 'ensime-db-step                         ;; "C-d s"
;; "e" 'ensime-db-step-out                     ;; "C-d o"
;; "e" 'ensime-db-next                         ;; "C-d n"
;; "e" 'ensime-db-run                          ;; "C-d r"
;; "e" 'ensime-db-continue                     ;; "C-d c"
;; "e" 'ensime-db-quit                         ;; "C-d q"
;; "e" 'ensime-db-inspect-value-at-point       ;; "C-d i"
;; "e" 'ensime-db-backtrace                    ;; "C-d t"
;; "e" 'ensime-db-clear-all-breaks             ;; "C-d a"
;; "e" 'ensime-sbt-switch                      ;; "C-b s"
;; "e" 'ensime-stacktrace-switch               ;; "C-b S"
;; "e" 'ensime-sbt-do-compile                  ;; "C-b c"
;; "e" 'ensime-sbt-do-clean                    ;; "C-b n"
;; "e" 'ensime-sbt-do-test-only                ;; "C-b o"
;; "e" 'ensime-sbt-do-package                  ;; "C-b p"
;; "e" 'ensime-sbt-do-run                      ;; "C-b r"
;; "e" 'ensime-sbt-do-test                     ;; "C-b T"
;; "e" 'ensime-sbt-do-test-quick               ;; "C-b t"
;; "e" 'ensime-db-clear-break                  ;; "C-d u"
;; "e" 'ensime-db-step                         ;; "C-d s"
;; "e" 'ensime-db-next                         ;; "C-d n"
;; "e" 'ensime-db-run                          ;; "C-d r"
;; "e" 'ensime-db-continue                     ;; "C-d c"
;; "e" 'ensime-db-quit                         ;; "C-d q"
;; "e" 'ensime-db-list-locals                  ;; "C-d l"
;; For each package, define a function adamchandra/init-<package-adamchandra>
;;
;; (defun adamchandra/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
