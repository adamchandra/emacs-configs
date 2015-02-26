(message "loading adamchandra/extensions.el")

(defvar adamchandra-pre-extensions
  '(
    ;; pre extension names go here
    )
  "List of all extensions to load before the packages.")

(defvar adamchandra-post-extensions
  '(
    ;; post extension names go here
    acs-theme
    )
  "List of all extensions to load after the packages.")

(defun adamchandra/init-acs-theme()
  "Init my theme"
  )

;; For each extension, define a function NAME/init-<extension-name>
;;
;; (defun NAME/init-my-extension ()
;;   "Initialize my extension"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
