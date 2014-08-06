;;;; ensime version of scala setup
;; (require 'ensime)

;;(defun scala-mode-setup()
;;   (interactive)
;;  ;; (defun scala-mode-hook())
;;  ;; (add-hook 'scala-mode-hook 'scala-mode-hook)
;;  (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
;;  )

(defun haskell-setup()
  (interactive)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
  ;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent) ; simpler indentation
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation) ; advanced indentation
  )

(defun gnuplot-mode-setup()
  (interactive)
  (autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
  (autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
  (global-set-key [(f9)] 'gnuplot-make-buffer)
  )


(defun raise-bookmark-buffer()
  (interactive)
  (switch-to-buffer "*Bookmark List*"))

(defun flip-to-last-buffer (&optional n)
  (interactive "p")
  (switch-to-buffer (car (cdr (buffer-list)))))

(defun revert-buffer-and-refind-position()
	(interactive)
	(let ((p (point-marker)))
		(revert-buffer t t t)
		(goto-char p)))

(defun my-indent-function ()
  (interactive)
  (cond ((not mark-active)
		 (indent-according-to-mode))
		(t
		 (indent-region (point-marker) (mark-marker)))))

(defun find-kbd-macro-file ()
  (interactive)
  (set-buffer (find-file (concat *emacs-root* "kbd-macros.el"))))

(defun coffee-custom ()
  ;; CoffeeScript uses two spaces.
  (make-local-variable 'tab-width)
  (set 'tab-width 2)

  ;; If you don't want your compiled files to be wrapped
  ;; (setq coffee-args-compile '("-c" "--bare"))

  ;; *Messages* spam
  (setq coffee-debug-mode t)

  ;; Emacs key binding
  (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)

  ;; Compile '.coffee' files on every save
  (and (file-exists-p (buffer-file-name))
       (file-exists-p (coffee-compiled-file-name))
       (coffee-cos-mode t)))

(add-hook 'coffee-mode-hook
          '(lambda() (coffee-custom)))

(defun jade-custom ()
  (define-key jade-mode-map [(meta r)] 'coffee-compile-buffer)
  )

(add-hook 'jade-mode-hook '(lambda() (jade-custom)))
;; (remove-hook 'jade-mode-hook '(lambda() (vline-mode nil)))
