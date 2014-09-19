;; Place your bindings here.
;; Default Emacs Live bindings


;; C-c Groups
;;
;;e - eval and replace
;;b - winner undo
;;f - winner redo
;;g - git gutter
;;l - lispy shortcuts (i.e. paredit and clojure specific fns)
;;m - emacs eval shortcuts
;;t - text shortcuts
;;i - utf8 char shortcuts
;;j - quick-jump shortcuts
;;d - diff shortcuts
;;p - project shortcuts
;;s - show popupwindows
;;w - window and buffer shortcuts


;; Should be able to eval-and-replace anywhere.
(global-set-key (kbd "C-c e") 'eval-and-replace)

;; winner undo and redo
(global-set-key (kbd "C-c b") 'winner-undo)
(global-set-key (kbd "C-c f") 'winner-redo)

;; Git Gutter
;; (global-set-key (kbd "C-c g g") 'git-gutter:toggle)

;;;; Jump to next/previous diff
;;(global-set-key (kbd "C-c g p") 'git-gutter:previous-diff)
;;(global-set-key (kbd "C-c g n") 'git-gutter:next-diff)
;;(global-set-key (kbd "C-c g d") 'git-gutter:popup-diff)
;;(global-set-key (kbd "C-c g r") 'git-gutter:revert-hunk)

;;text manipulation shortcuts
(global-set-key (kbd "C-c t b") 'untabify-buffer)
(global-set-key (kbd "C-c t r") 'untabify)

;;emacs-lisp shortcuts
(global-set-key (kbd "C-c m s") 'eval-and-replace) ;swap
(global-set-key (kbd "C-c m b") 'eval-buffer)
(global-set-key (kbd "C-c m e") 'eval-last-sexp)
(global-set-key (kbd "C-c m i") 'eval-expression)
(global-set-key (kbd "C-c m d") 'eval-defun)
(global-set-key (kbd "C-c m n") 'eval-print-last-sexp)
(global-set-key (kbd "C-c m r") 'eval-region)

;;(global-set-key (kbd "C-c n e b") 'cider-eval-buffer)


;;funky characters
;;(global-set-key (kbd "C-c i l") (lambda () (interactive) (insert "λ")))
;;(global-set-key (kbd "C-c i n") (lambda () (interactive) (insert "ℕ")))
;;(global-set-key (kbd "C-c i i") (lambda () (interactive) (insert "∞")))
;;(global-set-key (kbd "C-c i .") (lambda () (interactive) (insert "×")))
;;(global-set-key (kbd "C-c i 0") (lambda () (interactive) (insert "∅")))
;;(global-set-key (kbd "C-c i u") (lambda () (interactive) (insert "∪")))
;;(global-set-key (kbd "C-c i s") (lambda () (interactive) (insert "♯")))
;;(global-set-key (kbd "C-c i f") (lambda () (interactive) (insert "♭")))
;;(global-set-key (kbd "C-c i p") (lambda () (interactive) (insert "£")))

(global-set-key (kbd "C-c j p") 'quick-jump-go-back)
(global-set-key (kbd "C-c j b") 'quick-jump-go-back)
(global-set-key (kbd "C-c j m") 'quick-jump-push-marker)
(global-set-key (kbd "C-c j n") 'quick-jump-go-forward)
(global-set-key (kbd "C-c j f") 'quick-jump-go-forward)
(global-set-key (kbd "C-c j c") 'quick-jump-clear-all-marker)

;;diff shortcuts
(global-set-key (kbd "C-c d f") 'diff-buffer-with-file)


(global-set-key (kbd "C-c s t") 'live-show-ansi-terminal)
(global-set-key (kbd "C-c s n") 'live-new-ansi-terminal)
(global-set-key (kbd "C-c s m") 'live-show-messages)

;;window and buffer movement
(global-set-key (kbd "C-c w s") 'swap-windows)
(global-set-key (kbd "C-c w r") 'rotate-windows)
(global-set-key (kbd "C-c w p") 'buf-move-up)
(global-set-key (kbd "C-c w n") 'buf-move-down)
(global-set-key (kbd "C-c w b") 'buf-move-left)
(global-set-key (kbd "C-c w f") 'buf-move-right)
(global-set-key (kbd "C-c w .") 'shrink-window-horizontally)
(global-set-key (kbd "C-c w ,") 'enlarge-window-horizontally)
(global-set-key (kbd "C-c w /") (lambda () (interactive) (enlarge-window -1)))
(global-set-key (kbd "C-c w '") (lambda () (interactive) (enlarge-window 1)))

;; clojure

;;(define-key clojure-mode-map (kbd "C-c l l") 'align-cljlet)
;;(define-key clojure-mode-map (kbd "C-M-z")   'align-cljlet)

;; (define-key paredit-mode-map (kbd "C-c l k") 'paredit-splice-sexp-killing-forward)
;; (define-key paredit-mode-map (kbd "C-c l w") 'paredit-splice-sexp-killing-backward)
;; (define-key paredit-mode-map (kbd "C-c l l") 'align-cljlet)
;; (define-key paredit-mode-map (kbd "C-c l t") 'fill-paragraph)
;; (define-key paredit-mode-map (kbd "C-c l j") 'live-paredit-forward-slurp-sexp-neatly)
;; (define-key paredit-mode-map (kbd "C-M-e")   'paredit-backward-barf-sexp)
;; (define-key paredit-mode-map (kbd "C-M-s")   'paredit-backward-slurp-sexp)
;; (define-key paredit-mode-map (kbd "C-M-j")   'live-paredit-forward-slurp-sexp-neatly)
;; (define-key paredit-mode-map (kbd "C-M-y")   'paredit-forward-barf-sexp)
;; (define-key paredit-mode-map (kbd "C-M-z")   'align-cljlet)
;; (define-key paredit-mode-map (kbd "M-S")     'paredit-split-sexp)
;; (define-key paredit-mode-map (kbd "M-s")     'paredit-splice-sexp)
;; (define-key paredit-mode-map (kbd "M-j")     'paredit-join-sexps)
;; (define-key paredit-mode-map (kbd "M-P")     'live-paredit-previous-top-level-form)
;; (define-key paredit-mode-map (kbd "M-N")     'live-paredit-next-top-level-form)
;; (define-key paredit-mode-map (kbd "C-M-f")   'live-paredit-forward)
;; (define-key paredit-mode-map (kbd "M-q")     'live-paredit-reindent-defun)
;; (define-key paredit-mode-map (kbd "M-d")     'live-paredit-forward-kill-sexp)
;; (define-key paredit-mode-map (kbd "M-k")     'live-paredit-backward-kill)
;; (define-key paredit-mode-map (kbd "M-\\")    'live-paredit-delete-horizontal-space)
;; (define-key paredit-mode-map (kbd "C-M-i")   'paredit-forward-down)
;; (define-key paredit-mode-map (kbd "C-M-n")   'paredit-forward-up)
;; (define-key paredit-mode-map (kbd "C-M-p")   'paredit-backward-down)
;; (define-key paredit-mode-map (kbd "C-M-u")   'paredit-backward-up)
;; (define-key paredit-mode-map (kbd "M-T")     'transpose-sexps)
;; (define-key paredit-mode-map (kbd "C-M-k")   'live-paredit-copy-sexp-at-point)


;;;;make ^h delete rather than help
;; (global-set-key (kbd "C-h") 'delete-backward-char)
;;(define-key paredit-mode-map (kbd "C-h") 'paredit-backward-delete)

;; org-mode
(define-key org-mode-map (kbd "C-M-f")    'org-metadown)
(define-key org-mode-map (kbd "C-M-b")    'org-metaup)
(define-key org-mode-map (kbd "C-M-l")    'org-shiftright)
(define-key org-mode-map (kbd "C-M-j")    'org-shiftleft)
(define-key org-mode-map (kbd "C-M-i")    'org-shiftup)
(define-key org-mode-map (kbd "C-M-k")    'org-shiftdown)
(define-key org-mode-map (kbd "C-M-_")    'live-decrement-number-at-point)

;;increment and decrement number at point
(global-set-key (kbd "C-M-_")  'live-decrement-number-at-point)
(global-set-key (kbd "M-=")    'live-increment-number-at-point)
(global-set-key (kbd "C-M-=")    'live-increment-number-at-point)


;;browse kill ring (visual paste)
(global-set-key (kbd "M-y") 'browse-kill-ring)

;;make C-] and M-] cut and copy respectively
(global-set-key (kbd "C-]") 'kill-region)
(global-set-key (kbd "M-]") 'kill-ring-save)

;; undo
(global-set-key (kbd "C-M-_") 'undo-tree-undo)
(global-set-key (kbd "C-_")   'undo-tree-undo)

;;mark current function
(global-set-key (kbd "C-x C-p") 'mark-defun)

;;use delete-horizontal-space to completely nuke all whitespace
(global-set-key (kbd "M-SPC ") 'live-delete-whitespace-except-one)


;;redefine help shortcut
(global-set-key (kbd "M-h") 'help-command)
(define-key org-mode-map (kbd "M-h") 'help-command)

;;allow the deletion of words:
;;backward kill word (forward kill word is M-d)
(global-set-key (kbd "C-\\") 'backward-kill-word)
(define-key ido-file-completion-map (kbd "C-\\") 'backward-kill-word)
;;;(define-key paredit-mode-map (kbd "C-\\") 'paredit-backward-kill-word)

;;kill line backwards
(global-set-key (kbd "M-k") 'live-backwards-kill-line)

;;kill regions
(global-set-key (kbd "C-x C-k") 'kill-region)

;;set the mark
(global-set-key (kbd "C-SPC") 'set-mark-command)

;;repeat previous command
(global-set-key (kbd "M-'") 'repeat)

;;scroll other window
(global-set-key (kbd "C-M-]") 'scroll-other-window)
(global-set-key (kbd "C-M-[") 'scroll-other-window-down)



;;fast vertical naviation
(global-set-key  (kbd "M-U") (lambda () (interactive) (forward-line -10)))
(global-set-key  (kbd "M-D") (lambda () (interactive) (forward-line 10)))
(global-set-key  (kbd "M-p") 'outline-previous-visible-heading)
(global-set-key  (kbd "M-n") 'outline-next-visible-heading)

;;requires cua-mode for rectangle selection
(global-set-key (kbd "<C-return>") 'cua-set-rectangle-mark)

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; comment region
(global-set-key (kbd "M-/") 'comment-or-uncomment-region)

(global-set-key (kbd "C-s")   'isearch-forward)
(global-set-key (kbd "C-r")   'isearch-backward)
(global-set-key (kbd "C-M-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-M-r") 'isearch-backward-regexp)

;; Jump to a definition in the current file.
(global-set-key (kbd "C-x C-i") 'idomenu)

;; File
(global-set-key (kbd "C-x M-f")   'ido-find-file-other-window)
(global-set-key (kbd "C-x C-M-f") 'find-file-in-project)
(global-set-key (kbd "C-x f")     'live-recentf-ido-find-file)
(global-set-key (kbd "C-x C-r")   'ido-recentf-open)
(global-set-key (kbd "M-`")       'file-cache-minibuffer-complete)
(global-set-key (kbd "C-x C-b")   'ibuffer)

;; Window switching.
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward two

;; If you want to be able to M-x without meta
(global-set-key (kbd "C-x C-m") 'execute-extended-command)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string (regexp-quote isearch-string))))))

;; Ace jump mode
(global-set-key (kbd "C-o") 'ace-jump-mode)

;; Show documentation/information with M-RET
(define-key lisp-mode-shared-map (kbd "M-RET") 'live-lisp-describe-thing-at-point)
;;(define-key cider-repl-mode-map (kbd "M-RET") 'cider-doc)
;;(define-key cider-mode-map (kbd "M-RET") 'cider-doc)
 
(global-set-key (kbd "C-x o") 'win-switch-dispatch)

(global-set-key (kbd "C-x !") 'live-server-kill-terminal)


(global-set-key (kbd "M-j") 'next-line)
(global-set-key (kbd "M-k") 'previous-line)
(global-set-key (kbd "M-h") 'backward-char)
(global-set-key (kbd "M-l") 'forward-char)

(global-set-key (kbd "M-J") 'forward-paragraph)
(global-set-key (kbd "M-K") 'backward-paragraph)


;;(define-key global-map (kbd "C-+") 'text-scale-increase)
;;(define-key global-map (kbd "C--") 'text-scale-decrease)
(global-unset-key (kbd "C-c g"))
(global-unset-key (kbd "C-c n"))


;;(define-key paredit-mode-map (kbd ")")
;;  'paredit-close-round-and-newline)
;;;;;   (define-key paredit-mode-map (kbd "M-)")
;;;;;     'paredit-close-round)
;; 
;;;;(eval-after-load 'paredit
;;;;  (progn
;;;;    (message "loading paredit custom keys")
;;;;    ;;(define-key paredit-mode-map (kbd "C-.") paredit-forward)
;;;;    ))

;; (setq paredit-mode-hook nil)
;;(defun my-paredit-hook ()
;;  (interactive)
;;  (local-unset-key (kbd "M-p"))
;; 
;;  ;; (define-key paredit-mode-map (kbd "C-(") 'forward-word)
;;  ;;(define-key paredit-mode-map (kbd "C-)") 'forward-word)
;; 
;;  (define-key paredit-mode-map (kbd "<C-right>") 'forward-word)
;;  (define-key paredit-mode-map (kbd "<C-left>") 'backward-word)
;; 
;;  (define-key paredit-mode-map (kbd "M-p f s") 'paredit-forward-slurp-sexp)
;;  (define-key paredit-mode-map (kbd "M-p b s") 'paredit-backward-slurp-sexp)
;;  (define-key paredit-mode-map (kbd "M-p f b") 'paredit-forward-barf-sexp)
;;  (define-key paredit-mode-map (kbd "M-p b b") 'paredit-backward-barf-sexp)
;;  (define-key paredit-mode-map (kbd "M-\\") 'kill-current-buffer)
;;  (define-key paredit-mode-map (kbd "C-.") 'paredit-forward)
;;  (define-key paredit-mode-map (kbd "C-,") 'paredit-forward))
;; 
;; 
;;(add-hook 'paredit-mode-hook 'my-paredit-hook)




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



(defun helm-do-zgrep-with-prefix-arg ()
  (interactive)
  (let ((current-prefix-arg helm-command-prefix))
    (call-interactively 'helm-do-zgrep)))


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

          ([(control ?&)              ] helm-git-grep)
          ([(control ?7)              ] helm-projectile)
          ([(control ?8)              ] helm-buffers-list)
          ([(control ?*)              ] helm-find-files)

          ([(control ?9)              ] bs-cycle-previous)
          ([(control ?0)              ] bs-cycle-next)
          ([(control tab)             ] (lambda() (interactive) (other-window 1)))
          ([(control shift iso-lefttab)] (lambda() (interactive) (other-window -1)))
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

          ([f12                       ] raise-bookmark-buffer)
          ([f5                        ] ensime-compile-errors)
          ([f8                        ] deft)
          ([(control f8)              ] org-agenda)
          ([f11                       ] (lambda() (interactive) (ansi-term "/usr/bin/zsh"))))))





(my-keys)
