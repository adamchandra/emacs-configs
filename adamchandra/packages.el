(defvar adamchandra-packages
  '(
    ;; package adamchandras go here
    deft
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar adamchandra-excluded-packages '()
  "List of packages to exclude.")

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

;; For each package, define a function adamchandra/init-<package-adamchandra>
;;
;; (defun adamchandra/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
