(autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)
(add-hook 'espresso-mode-hook 'espresso-custom-setup)
(add-to-list 'auto-mode-alist '("\\.js\\'" . espresso-mode))
(autoload 'espresso-mode "espresso" nil t)

(defun espresso-custom-setup ()
  (mozrepl-setup)
  (moz-minor-mode 1))

;; (add-hook 'javascript-mode-hook 'javascript-custom-setup)
;; (defun javascript-custom-setup () (moz-minor-mode 1))



(defun html-mode-hook-callback ()
  (interactive)
  (emmet-mode)
  ;;(local-set-key (kbd "C-I") 'emmet-expand-line)
  ;; (local-set-key (kbd "TAB") 'indent-for-tab-command)
  (local-unset-key (kbd "TAB"))
  
  (mozrepl-setup)
  (moz-minor-mode 1)
  (moz-enable-auto-update)
  
  )

(add-hook 'html-mode-hook 'html-mode-hook-callback)

(defun mozrepl-setup()
  (interactive)
  (require 'moz)
  (require 'json)
  
  (local-set-key (kbd "C-x p")
                  (lambda ()
                    (interactive)
                    (comint-send-string (inferior-moz-process)
                                        "BrowserReload();")))

  ;; update innerHtml on any change (no save required)
  (defun moz-update (&rest ignored)
    "Update the remote mozrepl instance"
    (interactive)
    (comint-send-string (inferior-moz-process)
                        (concat "content.document.body.innerHTML="
                                (json-encode (buffer-string)) ";")))
  
  
  
  ;; (comint-send-string (inferior-moz-process) "setTimeout(function(){content.document.location.reload(true);}, '500');")

  (defun moz-enable-auto-update ()
    "Automatically the remote mozrepl when this buffer changes"
    (interactive)
    (add-hook 'after-change-functions 'moz-update t t))
  
  (defun moz-disable-auto-update ()
    "Disable automatic mozrepl updates"
    (interactive)
    (remove-hook 'after-change-functions 'moz-update t))


  ;; reload browser completely on file save
  (defun auto-reload-firefox-on-after-save-hook ()         
    (add-hook 'after-save-hook
              '(lambda ()
                 (interactive)
                 (comint-send-string (inferior-moz-process)
                                     "setTimeout(BrowserReload(), \"1000\");"))
              'append 'local)) ; buffer-local


  (add-hook 'html-mode-hook 'auto-reload-firefox-on-after-save-hook)
  (add-hook 'css-mode-hook 'auto-reload-firefox-on-after-save-hook)
  )


(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.


(add-to-list 'load-path "/home/saunders/projects/the-toolshed/javascripts/tern/emacs")
(autoload 'tern-mode "tern.el" nil t)

(defun js-mode-hook-cb ()
  (local-unset-key (kbd "M-j"))
  (tern-mode t)
  (disable-paredit-mode)
  (mozrepl-setup)
  (moz-minor-mode 1))


(add-hook 'javascript-ide-mode-hook 'js-mode-hook-cb)
(add-hook 'js-mode-hook 'js-mode-hook-cb)
(add-hook 'js2-mode-hook 'js-mode-hook-cb)



          


;;(defun ome-tern-setup ()
;;  (when (el-get-package-installed-p 'js2-mode)
;;    (add-hook 'js2-mode-hook (lambda () (tern-mode t))))
;;  (when (el-get-package-installed-p 'js3-mode)
;;    (add-hook 'js3-mode-hook (lambda () (tern-mode t))))
;;  (setq tern-command (cons (executable-find "tern") '()))
;;  (eval-after-load 'tern
;;    '(progn
;;       (require 'tern-auto-complete)
;;       (tern-ac-setup))))
;; 
;;(ome-tern-setup)
