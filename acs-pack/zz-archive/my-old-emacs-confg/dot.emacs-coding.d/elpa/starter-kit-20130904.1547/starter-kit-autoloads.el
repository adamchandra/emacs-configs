;;; starter-kit-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "starter-kit" "../../../../../../../.emacs.d/elpa/starter-kit-20130904.1547/starter-kit.el"
;;;;;;  "868e9e83593b254ee33644f7bca7545d")
;;; Generated autoloads from ../../../../../../../.emacs.d/elpa/starter-kit-20130904.1547/starter-kit.el

(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode)) (when (fboundp mode) (funcall mode -1)))

(mapc 'require '(uniquify starter-kit-defuns starter-kit-misc))

(setq esk-system-config (concat user-emacs-directory system-name ".el") esk-user-config (concat user-emacs-directory user-login-name ".el") esk-user-dir (concat user-emacs-directory user-login-name))

(setq smex-save-file (concat user-emacs-directory ".smex-items"))

(smex-initialize)

(global-set-key (kbd "M-x") 'smex)

(defun esk-eval-after-init (form) "\
Add `(lambda () FORM)' to `after-init-hook'.

    If Emacs has already finished initialization, also eval FORM immediately." (let ((func (list (quote lambda) nil form))) (add-hook (quote after-init-hook) func) (when after-init-time (eval form))))

(esk-eval-after-init '(progn (when (file-exists-p esk-system-config) (load esk-system-config)) (when (file-exists-p esk-user-config) (load esk-user-config)) (when (file-exists-p esk-user-dir) (mapc 'load (directory-files esk-user-dir t "^[^#].*el$")))))

;;;***

;;;### (autoloads nil nil ("../../../../../../../.emacs.d/elpa/starter-kit-20130904.1547/starter-kit-defuns.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/starter-kit-20130904.1547/starter-kit-misc.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/starter-kit-20130904.1547/starter-kit-pkg.el"
;;;;;;  "../../../../../../../.emacs.d/elpa/starter-kit-20130904.1547/starter-kit.el")
;;;;;;  (21454 34557 622818 939000))

;;;***

(provide 'starter-kit-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; starter-kit-autoloads.el ends here
