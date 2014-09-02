;; symlink to user home to override emacs live defaults (packs etc)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  (package-initialize)                ;; Initialize & Install Package
  )


;; Default
;;(live-use-packs '(
;;                  stable/foundation-pack
;;                  stable/colour-pack
;;                  stable/lang-pack
;;                  stable/power-pack
;;                  stable/git-pack
;;                  stable/org-pack
;;                  stable/clojure-pack
;;                  stable/bindings-pack
;;                  ))

(live-use-packs '(
                  stable/foundation-pack
                  stable/colour-pack
                  stable/lang-pack
                  stable/power-pack
                  stable/git-pack
                  stable/org-pack
                  stable/clojure-pack
                  stable/acs-pack
                  ))

;; (live-add-packs '(stable/acs-pack))
