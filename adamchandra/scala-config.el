
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

(provide 'scala-config)
