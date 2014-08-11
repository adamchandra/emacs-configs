;; Place your bindings here.

;;(define-key global-map (kbd "C-+") 'text-scale-increase)
;;(define-key global-map (kbd "C--") 'text-scale-decrease)

   (define-key paredit-mode-map (kbd ")")
     'paredit-close-round-and-newline)
;;;   (define-key paredit-mode-map (kbd "M-)")
;;;     'paredit-close-round)

;;(eval-after-load 'paredit
;;  (progn
;;    (message "loading paredit custom keys")
;;    ;;(define-key paredit-mode-map (kbd "C-.") paredit-forward)
;;    ))

;; (set 'paredit-mode-hook '())
(add-hook 'paredit-mode-hook
          (defun my-paredit-hook ()
            (define-key paredit-mode-map "M-p f s" 'paredit-forward-slurp-sexp)
            (define-key paredit-mode-map "M-p b s" 'paredit-backward-slurp-sexp)
            (define-key paredit-mode-map "M-p f b" 'paredit-forward-barf-sexp)
            (define-key paredit-mode-map "M-p b b" 'paredit-backward-barf-sexp)
            (define-key paredit-mode-map "M-\\" 'kill-current-buffer)
            (define-key paredit-mode-map "C-." 'paredit-forward)
            (define-key paredit-mode-map "C-," 'paredit-forward)))



;;  (mapc
;;   #'(lambda(kf) (define-key paredit-mode-map (car kf) (cadr kf)))
;;   '(
;;     ([(control ?.)              ] paredit-forward)
;;     ([(control ?>)              ] paredit-forward-down)
;;
;;     ([(control meta ?.)         ] paredit-forward-up)
;;     ;;([(control meta ?>)         ] paredit-forward-up)
;;
;;     ([(control ?,)              ] paredit-backward)
;;     ([(control ?<)              ] paredit-backward-down)
;;     ([(control meta ?,)         ] paredit-backward-up)
;;     ;; ([(control meta ?<)         ] paredit-backward-up)
;;     )))



(defun my-keys()
  (interactive)
  (mapc 'global-unset-key
        '([(control ?x) (control ?c)] ;; was save-buffers-kill-emacs
          [(control ?z)]
          [(control next)]
          [(control ?c) (control ?m) ] ;; execute-extended-command)
          [(control ?c) (?m)         ] ;; execute-extended-command)
          [(control ?x) (control ?m) ] ;; execute-extended-command)
          [(control ?x) (m)          ] ;; execute-extended-command)
          [(meta ?/)]))

  (defun setkey (key-fn)
    (global-set-key
     (car key-fn)
     (cadr key-fn)))

  (defun set-key-local (keydef)
    (let ((key-binding (car keydef))
          (fun (cadr keydef))
          (mode-hook (caddr keydef)))
      (add-hook mode-hook
                '(lambda ()
                   (local-set-key key-binding fun)))))

  (mapc 'setkey
        '(
          ([(control ?m)              ] newline-and-indent)

          ([(meta ?\ )                ] helm-M-x)
          ;;([(meta ?\ )                ] execute-extended-command)
          ;; ([(meta ?\ )                ] smex)

          ([(meta control ?\ )        ] smex-major-mode-commands)
          ([(control ?c) (control ?k) ] clipboard-kill-region)
          ([(control ?y)              ] clipboard-yank)
          ([(meta ?w)                 ] kill-ring-save)


          ;; change font size, interactively
          ([(control ?+)              ] zoom-in)
          ([(control ?_)              ] zoom-out)
          ;;
          ;;([(control ?f)              ] forward-char)
          ;;([(control ?d)              ] backward-char)

          ([(control ?y)              ] yank)
          ([(control ?w)              ] backward-kill-word)
          ([(control ?x) (control ?k) ] kill-region)
          ([(control ?!)              ] delete-window)
          ([(control ?1)              ] delete-other-windows)
          ([(control ?2)              ] split-window-horizontally)
          ([(control ?3)              ] split-window-vertically)
          ([(control ?4)              ] ediff-buffers)

          ([(control ?&)              ] dirtree)
          ([(control ?7)              ] eproject-find-file)
          ([(control ?8)              ] helm-buffers-list)
          ([(control ?*)              ] helm-buffers-list)

          ([(control ?9)              ] bs-cycle-previous)
          ([(control ?0)              ] bs-cycle-next)
          ([(control ?\))             ] (lambda() (interactive) (other-window 1)))
          ([(control ?\()             ] (lambda() (interactive) (other-window -1)))
          ([(control meta ?0)         ] winner-redo)
          ([(control meta ?9)         ] winner-undo)
          ([(control kp-subtract)     ] delete-window)
          ([(meta ?\\)                ] kill-current-buffer)
          ([(meta ?/)                 ] hippie-expand)
          ([(shift kp-subtract)       ] kill-current-buffer-and-window)
          ([(shift right)             ] picture-forward-column)
          ([(shift ?\ )               ] just-one-space)
          ([(meta ?>)                 ] (lambda() (interactive) (find-file-existing (concat *orgfile-dir* "bookmark-index.org"))))
          ;; ([(control XF86Forward)     ] find-grep-dired)
          ;; ([(control tab)             ] sr-speedbar-toggle)
          ([(control ?o)              ] open-line)
          ([(control ?J)              ] ace-jump-mode)
          ([(control ?H)              ] ace-jump-mode-pop-mark)

          ;;([(control ?\>) (?s) (?o)    ] ag-search-occur)
          ;;([(control ?\>) (?s) (?c)    ] ag-search-class)
          ;;([(control ?\>) (?s) (?d)    ] ag-search-def)

          ;; basic navigation
          ([(meta j)              ] next-line)
          ([(meta k)              ] previous-line)
          ([(meta h)              ] backward-char)
          ([(meta l)              ] forward-char)

          ;; paredit
          ;;([(control meta ?\))        ] paredit-)
          ;;([(control meta ?\()        ] paredit-)
          ;;([(control meta ?})         ] paredit-)
          ;;([(control meta ?{)         ] paredit-)


          ([f12                       ] raise-bookmark-buffer)
          ([f5                        ] ensime-compile-errors)
          ([f8                        ] deft)
          ([(control f8)              ] org-agenda)
          ([f11                       ] (lambda() (interactive) (ansi-term "/usr/bin/zsh"))))))


(my-keys)
