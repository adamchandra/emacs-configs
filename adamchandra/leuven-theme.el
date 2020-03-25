(deftheme leuven
  "Created 2020-03-06.")

(custom-theme-set-variables
 'leuven
 '(ansi-color-faces-vector [default default default italic underline success warning error])
 '(ansi-color-names-vector ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"]))

(custom-theme-set-faces
 'leuven
 '(bold ((((class color) (min-colors 89)) (:weight bold :foreground "black"))))
 '(bold-italic ((((class color) (min-colors 89)) (:weight bold :slant italic :foreground "black"))))
 '(italic ((((class color) (min-colors 89)) (:slant italic :foreground "#1A1A1A"))))
 '(underline ((((class color) (min-colors 89)) (:underline t))))
 '(cursor ((((class color) (min-colors 89)) (:background "#0FB300"))))
 '(fringe ((((class color) (min-colors 89)) (:foreground "#9B9B9B" :background "#EDEDED"))))
 '(highlight ((((class color) (min-colors 89)) (:underline nil :background "#FFF876"))))
 '(region ((((class color) (min-colors 89)) (:background "#ABDFFA"))))
 '(secondary-selection ((((class color) (min-colors 89)) (:weight bold :background "#FBE448"))))
 '(isearch ((((class color) (min-colors 89)) (:weight bold :underline "#FF9632" :foreground nil :background "#FDBD33"))))
 '(isearch-fail ((((class color) (min-colors 89)) (:weight bold :foreground "black" :background "#FF9999"))))
 '(lazy-highlight ((((class color) (min-colors 89)) (:underline "#FF9632" :background "#FFFF00"))))
 '(trailing-whitespace ((((class color) (min-colors 89)) (:background "#FFFF57"))))
 '(mode-line ((((class color) (min-colors 89)) (:box (:line-width 1 :color "#1A2F54") :foreground "#85CEEB" :background "#335EA8"))))
 '(mode-line-inactive ((((class color) (min-colors 89)) (:box (:line-width 1 :color "#4E4E4C") :foreground "#F0F0EF" :background "#9B9C97"))))
 '(mode-line-buffer-id ((((class color) (min-colors 89)) (:weight bold :foreground "white"))))
 '(mode-line-emphasis ((((class color) (min-colors 89)) (:weight bold :foreground "white"))))
 '(mode-line-highlight ((((class color) (min-colors 89)) (:foreground "yellow"))))
 '(minibuffer-prompt ((((class color) (min-colors 89)) (:weight bold :foreground "black" :background "gold"))))
 '(escape-glyph ((((class color) (min-colors 89)) (:foreground "#008ED1"))))
 '(homoglyph ((((class color) (min-colors 89)) (:foreground "#008ED1"))))
 '(error ((((class color) (min-colors 89)) (:foreground "red"))))
 '(warning ((((class color) (min-colors 89)) (:weight bold :foreground "orange"))))
 '(success ((((class color) (min-colors 89)) (:foreground "green"))))
 '(font-lock-builtin-face ((((class color) (min-colors 89)) (:foreground "#006FE0"))))
 '(font-lock-comment-delimiter-face ((((class color) (min-colors 89)) (:foreground "#8D8D84"))))
 '(font-lock-comment-face ((((class color) (min-colors 89)) (:slant italic :foreground "#8D8D84"))))
 '(font-lock-constant-face ((((class color) (min-colors 89)) (:foreground "#D0372D"))))
 '(font-lock-doc-face ((((class color) (min-colors 89)) (:foreground "#036A07"))))
 '(font-lock-function-name-face ((((class color) (min-colors 89)) (:weight normal :foreground "#006699"))))
 '(font-lock-keyword-face ((((class color) (min-colors 89)) (:bold nil :foreground "#0000FF"))))
 '(font-lock-preprocessor-face ((((class color) (min-colors 89)) (:foreground "#808080"))))
 '(font-lock-regexp-grouping-backslash ((((class color) (min-colors 89)) (:weight bold :inherit nil))))
 '(font-lock-regexp-grouping-construct ((((class color) (min-colors 89)) (:weight bold :inherit nil))))
 '(font-lock-string-face ((((class color) (min-colors 89)) (:foreground "#008000"))))
 '(font-lock-type-face ((((class color) (min-colors 89)) (:weight normal :foreground "#6434A3"))))
 '(font-lock-variable-name-face ((((class color) (min-colors 89)) (:weight normal :foreground "#BA36A5"))))
 '(font-lock-warning-face ((((class color) (min-colors 89)) (:weight bold :foreground "red"))))
 '(link ((((class color) (min-colors 89)) (:weight normal :underline t :foreground "#006DAF"))))
 '(link-visited ((((class color) (min-colors 89)) (:underline t :foreground "#E5786D"))))
 '(button ((((class color) (min-colors 89)) (:underline t :foreground "#006DAF"))))
 '(header-line ((((class color) (min-colors 89)) (:weight bold :underline "black" :overline "black" :foreground "black" :background "#FFFF88"))))
 '(message-header-name ((((class color) (min-colors 89)) (:family "Sans Serif" :weight normal :foreground "#A3A3A2"))))
 '(message-header-cc ((((class color) (min-colors 89)) (:family "Sans Serif" :underline nil :foreground "#006DAF"))))
 '(message-header-other ((((class color) (min-colors 89)) (:family "Sans Serif" :slant normal :foreground "#666666"))))
 '(message-header-subject ((((class color) (min-colors 89)) (:family "Sans Serif" :weight bold :foreground "black"))))
 '(message-header-to ((((class color) (min-colors 89)) (:family "Sans Serif" :underline nil :foreground "#006DAF"))))
 '(message-cited-text-1 ((((class color) (min-colors 89)) (:foreground "#5050B0"))))
 '(message-separator ((((class color) (min-colors 89)) (:family "Sans Serif" :weight normal :foreground "#BDC2C6"))))
 '(message-header-newsgroups ((((class color) (min-colors 89)) (:family "Sans Serif" :foreground "#3399CC"))))
 '(message-header-xheader ((((class color) (min-colors 89)) (:family "Sans Serif" :slant normal :foreground "#666666"))))
 '(message-mml ((((class color) (min-colors 89)) (:foreground "forest green"))))
 '(diff-added ((((class color) (min-colors 89)) (:foreground "#008000" :background "#DDFFDD"))))
 '(diff-changed ((((class color) (min-colors 89)) (:foreground "#0000FF" :background "#DDDDFF"))))
 '(diff-context ((((class color) (min-colors 89)) (:foreground "gray33"))))
 '(diff-file-header ((((class color) (min-colors 89)) (:foreground "#800000" :background "#FFFFAF"))))
 '(diff-function ((((class color) (min-colors 89)) (:foreground "darkgray"))))
 '(diff-header ((((class color) (min-colors 89)) (:foreground "#800000" :background "#FFFFAF"))))
 '(diff-hunk-header ((((class color) (min-colors 89)) (:foreground "#990099" :background "#FFEEFF"))))
 '(diff-index ((((class color) (min-colors 89)) (:foreground "#800000" :background "#FFFFAF"))))
 '(diff-indicator-added ((((class color) (min-colors 89)) (:background "#AAFFAA"))))
 '(diff-indicator-changed ((((class color) (min-colors 89)) (:background "#8080FF"))))
 '(diff-indicator-removed ((((class color) (min-colors 89)) (:background "#FFBBBB"))))
 '(diff-removed ((((class color) (min-colors 89)) (:foreground "#A60000" :background "#FFDDDD"))))
 '(flyspell-duplicate ((((class color) (min-colors 89)) (:underline "#008000" :inherit nil))))
 '(flyspell-incorrect ((((class color) (min-colors 89)) (:underline "red" :inherit nil))))
 '(calendar-today ((((class color) (min-colors 89)) (:weight bold :foreground "#4F4A3D" :background "#FFFFCC"))))
 '(change-log-file ((((class color) (min-colors 89)) (:weight bold :foreground "#4183C4"))))
 '(comint-highlight-input ((((class color) (min-colors 89)) (:weight bold :foreground "#0000FF" :inherit nil))))
 '(comint-highlight-prompt ((((class color) (min-colors 89)) (:weight bold :foreground "#0000FF" :inherit nil))))
 '(compilation-error ((((class color) (min-colors 89)) (:weight bold :foreground "red"))))
 '(compilation-info ((((class color) (min-colors 89)) (:weight bold :foreground "#2A489E"))))
 '(compilation-line-number ((((class color) (min-colors 89)) (:weight bold :foreground "#A535AE"))))
 '(compilation-warning ((((class color) (min-colors 89)) (:weight bold :foreground "orange"))))
 '(custom-button ((((class color) (min-colors 89)) (:box (:line-width 2 :style released-button) :foreground "black" :background "lightgrey"))))
 '(custom-button-mouse ((((class color) (min-colors 89)) (:box (:line-width 2 :style released-button) :foreground "black" :background "grey90"))))
 '(custom-button-pressed ((((class color) (min-colors 89)) (:box (:line-width 2 :style pressed-button) :foreground "black" :background "light grey"))))
 '(custom-button-pressed-unraised ((((class color) (min-colors 89)) (:underline t :foreground "magenta4"))))
 '(custom-button-unraised ((((class color) (min-colors 89)) (:underline t))))
 '(custom-changed ((((class color) (min-colors 89)) (:foreground "white" :background "blue"))))
 '(custom-comment ((((class color) (min-colors 89)) (:background "gray85"))))
 '(custom-comment-tag ((((class color) (min-colors 89)) (:foreground "blue4"))))
 '(custom-documentation ((((class color) (min-colors 89)) (nil))))
 '(custom-face-tag ((((class color) (min-colors 89)) (:family "Sans Serif" :height 1.2 :weight bold))))
 '(custom-group-tag ((((class color) (min-colors 89)) (:height 1.2 :weight bold :foreground "blue1"))))
 '(custom-group-tag-1 ((((class color) (min-colors 89)) (:family "Sans Serif" :height 1.2 :weight bold :foreground "red1"))))
 '(custom-invalid ((((class color) (min-colors 89)) (:foreground "yellow" :background "red"))))
 '(custom-link ((((class color) (min-colors 89)) (:underline t :foreground "blue1"))))
 '(custom-modified ((((class color) (min-colors 89)) (:foreground "white" :background "blue"))))
 '(custom-rogue ((((class color) (min-colors 89)) (:foreground "pink" :background "black"))))
 '(custom-saved ((((class color) (min-colors 89)) (:underline t))))
 '(custom-set ((((class color) (min-colors 89)) (:foreground "blue" :background "white"))))
 '(custom-state ((((class color) (min-colors 89)) (:foreground "green4"))))
 '(custom-themed ((((class color) (min-colors 89)) (:foreground "white" :background "blue1"))))
 '(custom-variable-button ((((class color) (min-colors 89)) (:weight bold :underline t))))
 '(custom-variable-tag ((((class color) (min-colors 89)) (:family "Sans Serif" :height 1.2 :weight bold :foreground "blue1"))))
 '(custom-visibility ((((class color) (min-colors 89)) (:weight normal :underline t :foreground "#006DAF"))))
 '(diff-hl-change ((((class color) (min-colors 89)) (:foreground "blue3" :inherit diff-changed))))
 '(diff-hl-delete ((((class color) (min-colors 89)) (:foreground "red3" :inherit diff-removed))))
 '(diff-hl-insert ((((class color) (min-colors 89)) (:foreground "green4" :inherit diff-added))))
 '(dired-directory ((((class color) (min-colors 89)) (:weight bold :foreground "blue" :background "#FFFFD2"))))
 '(dired-header ((((class color) (min-colors 89)) (:weight bold :foreground "blue" :background "#FFFFD2"))))
 '(dired-ignored ((((class color) (min-colors 89)) (:strike-through t :foreground "red"))))
 '(dired-mark ((((class color) (min-colors 89)) (:weight bold :foreground "white" :background "red"))))
 '(dired-marked ((((class color) (min-colors 89)) (:weight bold :foreground "white" :background "red"))))
 '(dired-symlink ((((class color) (min-colors 89)) (:foreground "deep sky blue"))))
 '(file-name-shadow ((((class color) (min-colors 89)) (:foreground "#7F7F7F"))))
 '(helm-action ((((class color) (min-colors 89)) (:foreground "black"))))
 '(helm-buffer-process ((((class color) (min-colors 89)) (:foreground "#008200"))))
 '(helm-candidate-number ((((class color) (min-colors 89)) (:foreground "black" :background "#FFFF66"))))
 '(helm-ff-directory ((((class color) (min-colors 89)) (:weight bold :foreground "blue" :background "#FFFFD2"))))
 '(helm-ff-executable ((((class color) (min-colors 89)) (:foreground "green3" :background "white"))))
 '(helm-ff-file ((((class color) (min-colors 89)) (:foreground "black"))))
 '(helm-ff-invalid-symlink ((((class color) (min-colors 89)) (:foreground "yellow" :background "red"))))
 '(helm-ff-symlink ((((class color) (min-colors 89)) (:foreground "deep sky blue"))))
 '(helm-grep-match ((((class color) (min-colors 89)) (:weight bold :background "#FBE448"))))
 '(helm-grep-lineno ((((class color) (min-colors 89)) (:foreground "#7F7F7F"))))
 '(helm-match ((((class color) (min-colors 89)) (:weight bold :background "#FBE448"))))
 '(helm-moccur-buffer ((((class color) (min-colors 89)) (:foreground "#0066CC"))))
 '(helm-selection ((((class color) (min-colors 89)) (:underline nil :background "#FFF876"))))
 '(helm-selection-line ((((class color) (min-colors 89)) (:underline nil :background "#FFF876"))))
 '(helm-source-header ((((class color) (min-colors 89)) (:family "Sans Serif" :height 1.3 :weight bold :foreground "white" :background "#2F69BF"))))
 '(helm-visible-mark ((((class color) (min-colors 89)) (:weight bold :foreground "white" :background "red"))))
 '(hl-line ((((class color) (min-colors 89)) (:background "#FFFFD7"))))
 '(info-header-node ((((class color) (min-colors 89)) (:underline t :foreground "orange"))))
 '(info-header-xref ((((class color) (min-colors 89)) (:underline t :foreground "dodger blue"))))
 '(info-menu-header ((((class color) (min-colors 89)) (:height 1.0 :weight bold :overline "#123555" :foreground "#123555" :background "#E5F4FB"))))
 '(info-menu-star ((((class color) (min-colors 89)) (:foreground "black"))))
 '(info-node ((((class color) (min-colors 89)) (:underline t :foreground "blue"))))
 '(info-title-1 ((((class color) (min-colors 89)) (:height 1.3 :weight bold :overline "#A7A7A7" :foreground "#3C3C3C" :background "#F0F0F0"))))
 '(info-xref ((((class color) (min-colors 89)) (:underline t :foreground "#006DAF"))))
 '(info-xref-visited ((((class color) (min-colors 89)) (:underline t :foreground "magenta4"))))
 '(linum ((((class color) (min-colors 89)) (:inherit (default shadow) :foreground "#9A9A9A" :background "#EDEDED"))))
 '(match ((((class color) (min-colors 89)) (:weight bold :background "#FBE448"))))
 '(next-error ((((class color) (min-colors 89)) (:underline nil :background "#FFF876"))))
 '(nobreak-space ((((class color) (min-colors 89)) (:background "#CCE8F6"))))
 '(org-agenda-calendar-event ((((class color) (min-colors 89)) (:weight bold :foreground "#3774CC" :background "#A8C5EF"))))
 '(org-agenda-calendar-sexp ((((class color) (min-colors 89)) (:foreground "#777777" :background "#E4EBFE"))))
 '(org-agenda-clocking ((((class color) (min-colors 89)) (:foreground "black" :background "#EEC900"))))
 '(org-agenda-column-dateline ((((class color) (min-colors 89)) (:height 1.0 :weight normal :slant normal :underline nil :strike-through nil :foreground "#E6AD4F" :background "#FFF2DE"))))
 '(org-agenda-current-time ((((class color) (min-colors 89)) (:underline t :foreground "#1662AF"))))
 '(org-agenda-date ((((class color) (min-colors 89)) (:height 1.6 :weight bold :foreground "#1662AF"))))
 '(org-agenda-date-today ((((class color) (min-colors 89)) (:height 1.6 :weight bold :foreground "#4F4A3D" :background "#FFFFCC"))))
 '(org-agenda-date-weekend ((((class color) (min-colors 89)) (:height 1.6 :weight bold :foreground "#4E4E4E"))))
 '(org-agenda-diary ((((class color) (min-colors 89)) (:weight bold :foreground "green4" :background "light blue"))))
 '(org-agenda-dimmed-todo-face ((((class color) (min-colors 89)) (:foreground "gold2"))))
 '(org-agenda-done ((((class color) (min-colors 89)) (:foreground "#555555"))))
 '(org-agenda-filter-category ((((class color) (min-colors 89)) (:weight bold :foreground "orange"))))
 '(org-agenda-filter-tags ((((class color) (min-colors 89)) (:weight bold :foreground "orange"))))
 '(org-agenda-restriction-lock ((((class color) (min-colors 89)) (:background "#E77D63"))))
 '(org-agenda-structure ((((class color) (min-colors 89)) (:height 1.6 :weight bold :foreground "#1F8DD6"))))
 '(org-archived ((((class color) (min-colors 89)) (:foreground "gray70"))))
 '(org-block ((((class color) (min-colors 89)) (:foreground "#000088" :background "#FFFFE0"))))
 '(org-block-begin-line ((((class color) (min-colors 89)) (:underline "#A7A6AA" :foreground "#555555" :background "#E2E1D5"))))
 '(org-block-end-line ((((class color) (min-colors 89)) (:overline "#A7A6AA" :foreground "#555555" :background "#E2E1D5"))))
 '(org-checkbox ((((class color) (min-colors 89)) (:weight bold :box (:line-width 1 :style pressed-button) :foreground "white" :background "#777777"))))
 '(org-clock-overlay ((((class color) (min-colors 89)) (:foreground "white" :background "SkyBlue4"))))
 '(org-code ((((class color) (min-colors 89)) (:foreground "#006400" :background "#FDFFF7"))))
 '(org-column ((((class color) (min-colors 89)) (:height 1.0 :weight normal :slant normal :underline nil :strike-through nil :foreground "#E6AD4F" :background "#FFF2DE"))))
 '(org-column-title ((((class color) (min-colors 89)) (:height 1.0 :weight normal :slant normal :underline nil :strike-through nil :foreground "#E6AD4F" :background "#FFF2DE"))))
 '(org-date ((((class color) (min-colors 89)) (:underline t :foreground "#00459E"))))
 '(org-default ((((class color) (min-colors 89)) (:foreground "#333333" :background "#FFFFFF"))))
 '(org-document-info ((((class color) (min-colors 89)) (:foreground "#484848"))))
 '(org-document-info-keyword ((((class color) (min-colors 89)) (:foreground "#008ED1" :background "#EAEAFF"))))
 '(org-document-title ((((class color) (min-colors 89)) (:family "Sans Serif" :height 1.8 :weight bold :foreground "black"))))
 '(org-done ((((class color) (min-colors 89)) (:weight bold :box (:line-width 1 :color "#BBBBBB") :foreground "#BBBBBB" :background "#F0F0F0"))))
 '(org-drawer ((((class color) (min-colors 89)) (:foreground "light sky blue"))))
 '(org-ellipsis ((((class color) (min-colors 89)) (:underline nil :box (:line-width 1 :color "#999999") :foreground "#999999" :background "#FFF8C0"))))
 '(org-footnote ((((class color) (min-colors 89)) (:underline t :foreground "#008ED1"))))
 '(org-formula ((((class color) (min-colors 89)) (:foreground "chocolate1"))))
 '(org-headline-done ((((class color) (min-colors 89)) (:height 1.0 :weight normal :strike-through t :foreground "#ADADAD"))))
 '(org-hide ((((class color) (min-colors 89)) (:foreground "#E2E2E2"))))
 '(org-latex-and-related ((((class color) (min-colors 89)) (:foreground "#336699" :background "white"))))
 '(org-level-1 ((((class color) (min-colors 89)) (:height 1.3 :weight bold :overline "#A7A7A7" :foreground "#3C3C3C" :background "#F0F0F0"))))
 '(org-level-2 ((((class color) (min-colors 89)) (:height 1.0 :weight bold :overline "#123555" :foreground "#123555" :background "#E5F4FB"))))
 '(org-level-3 ((((class color) (min-colors 89)) (:height 1.0 :weight bold :foreground "#005522" :background "#EFFFEF"))))
 '(org-level-4 ((((class color) (min-colors 89)) (:height 1.0 :weight bold :slant normal :foreground "#EA6300"))))
 '(org-level-5 ((((class color) (min-colors 89)) (:height 1.0 :weight bold :slant normal :foreground "#E3258D"))))
 '(org-level-6 ((((class color) (min-colors 89)) (:height 1.0 :weight bold :slant italic :foreground "#0077CC"))))
 '(org-level-7 ((((class color) (min-colors 89)) (:height 1.0 :weight bold :slant italic :foreground "#2EAE2C"))))
 '(org-level-8 ((((class color) (min-colors 89)) (:height 1.0 :weight bold :slant italic :foreground "#FD8008"))))
 '(org-link ((((class color) (min-colors 89)) (:weight normal :underline t :foreground "#006DAF"))))
 '(org-list-dt ((((class color) (min-colors 89)) (:weight bold :foreground "#335EA8"))))
 '(org-macro ((((class color) (min-colors 89)) (:foreground "white" :background "#EDB802"))))
 '(org-meta-line ((((class color) (min-colors 89)) (:slant normal :foreground "#008ED1" :background "#EAEAFF"))))
 '(org-mode-line-clock ((((class color) (min-colors 89)) (:box (:line-width 1 :color "#335EA8") :foreground "black" :background "#EEC900"))))
 '(org-mode-line-clock-overrun ((((class color) (min-colors 89)) (:weight bold :box (:line-width 1 :color "#335EA8") :foreground "white" :background "#FF4040"))))
 '(org-property-value ((((class color) (min-colors 89)) (:foreground "#00A000"))))
 '(org-quote ((((class color) (min-colors 89)) (:slant italic :foreground "dim gray" :background "#FFFFE0"))))
 '(org-scheduled ((((class color) (min-colors 89)) (:foreground "#333333"))))
 '(org-scheduled-previously ((((class color) (min-colors 89)) (:foreground "#F22659"))))
 '(org-scheduled-today ((((class color) (min-colors 89)) (:weight bold :foreground "#4F4A3D" :background "#FFFFCC"))))
 '(org-sexp-date ((((class color) (min-colors 89)) (:foreground "#3774CC"))))
 '(org-special-keyword ((((class color) (min-colors 89)) (:weight bold :foreground "#00BB00" :background "#EAFFEA"))))
 '(org-table ((((class color) (min-colors 89)) (:foreground "dark green" :background "#EAFFEA"))))
 '(org-tag ((((class color) (min-colors 89)) (:weight normal :slant italic :foreground "#9A9FA4" :background "white"))))
 '(org-target ((((class color) (min-colors 89)) (:weight normal :underline t :foreground "#006DAF"))))
 '(org-time-grid ((((class color) (min-colors 89)) (:foreground "#CFCFCF"))))
 '(org-todo ((((class color) (min-colors 89)) (:weight bold :box (:line-width 1 :color "#D8ABA7") :foreground "#D8ABA7" :background "#FFE6E4"))))
 '(org-upcoming-deadline ((((class color) (min-colors 89)) (:foreground "#FF5555"))))
 '(org-verbatim ((((class color) (min-colors 89)) (:foreground "#0066CC"))))
 '(org-verse ((((class color) (min-colors 89)) (:slant italic :foreground "dim gray" :background "#EEEEEE"))))
 '(org-warning ((((class color) (min-colors 89)) (:weight bold :foreground "black" :background "#CCE7FF"))))
 '(outline-1 ((((class color) (min-colors 89)) (:height 1.3 :weight bold :overline "#A7A7A7" :foreground "#3C3C3C" :background "#F0F0F0"))))
 '(outline-2 ((((class color) (min-colors 89)) (:height 1.0 :weight bold :overline "#123555" :foreground "#123555" :background "#E5F4FB"))))
 '(outline-3 ((((class color) (min-colors 89)) (:height 1.0 :weight bold :foreground "#005522" :background "#EFFFEF"))))
 '(outline-4 ((((class color) (min-colors 89)) (:height 1.0 :weight bold :slant normal :foreground "#EA6300"))))
 '(outline-5 ((((class color) (min-colors 89)) (:height 1.0 :weight bold :slant normal :foreground "#E3258D"))))
 '(outline-6 ((((class color) (min-colors 89)) (:height 1.0 :weight bold :slant italic :foreground "#0077CC"))))
 '(outline-7 ((((class color) (min-colors 89)) (:height 1.0 :weight bold :slant italic :foreground "#2EAE2C"))))
 '(outline-8 ((((class color) (min-colors 89)) (:height 1.0 :weight bold :slant italic :foreground "#FD8008"))))
 '(powerline-active1 ((((class color) (min-colors 89)) (:background "grey22" :inherit mode-line))))
 '(powerline-active2 ((((class color) (min-colors 89)) (:background "#4070B6" :inherit mode-line))))
 '(powerline-inactive1 ((((class color) (min-colors 89)) (:background "#686868" :inherit mode-line-inactive))))
 '(powerline-inactive2 ((((class color) (min-colors 89)) (:background "#A9A9A9" :inherit mode-line-inactive))))
 '(shadow ((((class color) (min-colors 89)) (:foreground "#7F7F7F"))))
 '(show-paren-match ((((class color) (min-colors 89)) (:background "#99CCFF"))))
 '(show-paren-mismatch ((((class color) (min-colors 89)) (:underline "red" :foreground nil :background "#FFDCDC"))))
 '(speedbar-button-face ((((class color) (min-colors 89)) (:foreground "green4"))))
 '(speedbar-directory-face ((((class color) (min-colors 89)) (:foreground "blue4"))))
 '(speedbar-file-face ((((class color) (min-colors 89)) (:foreground "cyan4"))))
 '(speedbar-highlight-face ((((class color) (min-colors 89)) (:underline nil :background "#FFF876"))))
 '(speedbar-selected-face ((((class color) (min-colors 89)) (:underline t :foreground "red"))))
 '(speedbar-tag-face ((((class color) (min-colors 89)) (:foreground "brown"))))
 '(tool-bar ((((class color) (min-colors 89)) (:box (:line-width 1 :style released-button) :foreground "black" :background "gray75"))))
 '(tooltip ((((class color) (min-colors 89)) (:foreground "black" :background "light yellow"))))
 '(trailing-whitespace ((((class color) (min-colors 89)) (:background "#F6EBFE"))))
 '(widget-button ((((class color) (min-colors 89)) (:weight normal :underline t :foreground "#006DAF"))))
 '(widget-button-pressed ((((class color) (min-colors 89)) (:foreground "red"))))
 '(widget-documentation ((((class color) (min-colors 89)) (:foreground "green4"))))
 '(widget-field ((((class color) (min-colors 89)) (:background "gray85"))))
 '(widget-inactive ((((class color) (min-colors 89)) (:foreground "dim gray"))))
 '(widget-single-line-field ((((class color) (min-colors 89)) (:background "gray85"))))
 '(default ((t (:background "cornsilk" :foreground "#003333")))))

(provide-theme 'leuven)