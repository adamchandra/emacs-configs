
;; how to clear a key if already set
;; (evil-leader/set-key "(p" ())

(evil-leader/set-key
  "ss" 'swiper
  "hc" 'evil-search-highlight-persist-remove-all
  "fea" 'find-my-init-files
  "fet" 'find-my-theme-file
  "wr" 'spacemacs/rotate-windows-forward
  "(pp" 'sp-push-hybrid-sexp
  "(kk" 'sp-kill-hybrid-sexp
  "(tt" 'sp-transpose-hybrid-sexp
  "(sx" 'sp-slurp-hybrid-sexp
  "(sl" 'sp-forward-slurp-sexp
  "(bl" 'sp-forward-barf-sexp
  "(sh" 'sp-backward-slurp-sexp
  "(bh" 'sp-backward-barf-sexp
  )

(evil-leader/set-key
  ">>" 'list-bookmarks
  ">ca"  'bmkp-autofile-set                         ; `pca'
  ">cf"  'bmkp-file-target-set                      ; `pcf'
  ">cM"  'bookmark-set                              ; `pcM'
  ">cs"  'bmkp-set-sequence-bookmark                ; `pcs'
  ">cF"  'bmkp-make-function-bookmark               ; `pcF'
  ">cK"  'bmkp-set-desktop-bookmark                 ; `pcK'
  ">cm"  'bmkp-bookmark-set-confirm-overwrite       ; `pcm'
  ">cu"  'bmkp-url-target-set                       ; `pcu'
  ">Ck"  'bmkp-wrap-bookmark-with-last-kbd-macro    ; `pC-k'
  ">cw"  'bmkp-set-snippet-bookmark                 ; `pcM-w'
  ">cy"  'bmkp-set-bookmark-file-bookmark           ; `pcy'
  ;; ">"  'bmkp-toggle-autonamed-bookmark-set/delete ; `pcRET'
  ">B"  'bmkp-choose-navlist-from-bookmark-list    ; `pB'
  ">E"  'bmkp-edit-bookmark-record                 ; `pE'
  ">I"  'bookmark-insert-location                  ; `pI'
  ">K"  'bmkp-set-desktop-bookmark                 ; `pK' (also `C-x r K', `C-x p c K'
  ">L"  'bmkp-switch-bookmark-file-create          ; `pL'
  ">m"  'bmkp-bookmark-set-confirm-overwrite       ; `pm'
  ">N"  'bmkp-navlist-bmenu-list                   ; `pN'
  ">o"  'bookmark-jump-other-window                ; `po' (also `C-x 4 j j'
  ">q"  'bookmark-jump-other-window                ; `pq' (also `C-x 4 j j'
  ">r"  'bmkp-edit-bookmark-name-and-location      ; `pr'
  ">w"  'bmkp-set-snippet-bookmark                 ; `pM-w' (also `C-x p c M-w'
  ;; ">"  'bmkp-toggle-autotemp-on-set               ; `px'
  ">y"  'bmkp-set-bookmark-file-bookmark           ; `py'
  ">h"  'bmkp-light-bookmark-this-buffer           ; `ph'
  ">H"  'bmkp-light-bookmarks                      ; `pH'
  ">u"  'bmkp-unlight-bookmark-this-buffer         ; `pu'
  ">U"  'bmkp-unlight-bookmarks                    ; `pU'
  ;; ">"  'bmkp-unlight-bookmark-here                ; `pC-u'
  ;; ">"  'bmkp-bookmarks-lighted-at-point           ; `p='
  ">,"  'bmkp-this-file/buffer-bmenu-list          ; `p,'
  ">?"  'bmkp-describe-bookmark                    ; `p?'
  ">:"  'bmkp-choose-navlist-of-type               ; `p:'
  ;; ">"  'bmkp-toggle-autonamed-bookmark-set/delete ; `pRET'
  )


;;sp-forward-sexp
;;sp-backward-sexp
;;sp-down-sexp
;;sp-backward-down-sexp
;;sp-beginning-of-sexp
;;sp-end-of-sexp
;;sp-up-sexp
;;sp-backward-up-sexp
;;sp-next-sexp
;;sp-previous-sexp
;;sp-kill-sexp
;;sp-copy-sexp
;;sp-unwrap-sexp
;;sp-backward-unwrap-sexp
;;sp-forward-slurp-sexp
;;sp-forward-barf-sexp
;;sp-backward-slurp-sexp
;;sp-backward-barf-sexp
;;sp-splice-sexp
;;sp-splice-sexp-killing-forward
;;sp-splice-sexp-killing-backward
;;sp-splice-sexp-killing-around
;;sp-select-next-thing-exchange
;;sp-select-next-thing
;;sp-forward-symbol
;;sp-backward-symbol



(global-set-key (kbd "C-\\") 'winner-undo)
(global-set-key (kbd "C-<f12>") 'eval-buffer)
(global-set-key (kbd "C-'") 'yas-expand-from-trigger-key)

;; (defun turn-off-slow-stuff ()
;;   (interactive)
;;   (ensime-mode -1)
;;   (auto-complete-mode -1)
;;   (turn-off-smartparens-mode)
;;   )
;; (global-set-key (kbd "<f9>") 'turn-off-slow-stuff)
;; (global-unset-key "\\")




(global-set-key (kbd "C-x C-s") 'enhanced-save-buffer)
