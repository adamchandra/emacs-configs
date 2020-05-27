;; python setup

(defun use-anaconda-mode ()
  (add-hook 'python-mode-hook 'anaconda-mode)
  (python :variables python-backend 'anaconda) ;; 'lsp

  )

(use-anaconda-mode)


;;  Backend can be chosen on a per project basis using directory local variables (files named .dir-locals.el at the root of a project), an example to use the lsp backend:

;; ;;; Directory Local Variables
;; ;;; For more information see (info "(emacs) Directory Variables")

;; ((python-mode (python-backend . lsp)))
