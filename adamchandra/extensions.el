(message "loading adamchandra/extensions.el")

(defvar adamchandra-pre-extensions
  '(
    ;; pre extension names go here
    )
  "List of all extensions to load before the packages.")

(defvar adamchandra-post-extensions
  '(
    ;; post extension names go here
    leuven-prime
    )
  "List of all extensions to load after the packages.")

(defun adamchandra/init-leuven-prime-theme ()
  "Based on Leuven theme"
  (use-package leuven-prime-theme
    :init
    (progn
      (require 'leuven-prime)
      (load-theme 'leuven-prime-theme t)
      )
    )
  )

(defun adamchandra/turn-off-messaging ()
  (use-package turn-off-messaging
    :init
    (progn
      (require 'turn-off-messaging)
      (setq messaging-on t)
      (turn-messaging-off))))


jkl





;; For each extension, define a function NAME/init-<extension-name>
;;
;; (defun NAME/init-my-extension ()
;;   "Initialize my extension"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
