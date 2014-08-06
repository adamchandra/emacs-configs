(eval-when-compile
  (require 'color-theme))

(defun color-theme-adam-chandra ()
  "Color theme by Adam Saunders, originally ripped off from somebody named Arneson"
  (interactive)
  (color-theme-install
   '(color-theme-adam-chandra
     ((background-color . "black")
      (background-mode . light)
      (background-toolbar-color . "#cf3ccf3ccf3c")
      (border-color . "#000000000000")
      (bottom-toolbar-shadow-color . "#79e77df779e7")
      (cursor-color . "Red")
      (foreground-color . "Beige")
      (top-toolbar-shadow-color . "#fffffbeeffff"))
     ((buffers-tab-face . buffers-tab)
      (cperl-here-face . font-lock-string-face)
      (cperl-invalid-face quote default)
      (cperl-pod-face . font-lock-comment-face)
      (cperl-pod-head-face . font-lock-variable-name-face)
      (ispell-highlight-face . highlight)
      (vc-mode-face . highlight)
      (vm-highlight-url-face . bold-italic)
      (vm-highlighted-header-face . bold)
      (vm-mime-button-face . gui-button-face)
      (vm-summary-highlight-face . bold))
     (default ((t (nil))))
     (bbdb-company ((t (nil))))
     (bbdb-field-name ((t (:bold t))))
     (bbdb-field-value ((t (nil))))
     (bbdb-name ((t (:underline t))))
     (blue ((t (:foreground "SteelBlue1"))))
     (bold ((t (:bold t))))
     (bold-italic ((t (:bold t :foreground "yellow"))))
     (border-glyph ((t (nil))))
     (buffers-tab ((t (:background "black" :foreground "LightSkyBlue"))))
     (cperl-array-face ((t (:bold t :foreground "SkyBlue2"))))
     (cperl-hash-face ((t (:foreground "LightBlue2"))))
     (cperl-invalid-face ((t (:foreground "white"))))
     (cperl-nonoverridable-face ((t (:foreground "chartreuse3"))))
     (custom-button-face ((t (:bold t))))
     (custom-changed-face ((t (:background "SteelBlue1" :foreground "white"))))
     (custom-comment-face ((t (:foreground "white"))))
     (custom-comment-tag-face ((t (:foreground "white"))))
     (custom-documentation-face ((t (nil))))
     (custom-face-tag-face ((t (:underline t))))
     (custom-group-tag-face ((t (:underline t :foreground "SteelBlue1"))))
     (custom-group-tag-face-1 ((t (:underline t :foreground "red"))))
     (custom-invalid-face ((t (:background "red" :foreground "yellow"))))
     (custom-modified-face ((t (:background "SteelBlue1" :foreground "white"))))
     (custom-rogue-face ((t (:background "black" :foreground "pink"))))
     (custom-saved-face ((t (:underline t))))
     (custom-set-face ((t (:background "white" :foreground "SteelBlue1"))))
     (custom-state-face ((t (:foreground "white"))))
     (custom-variable-button-face ((t (:underline t :bold t))))
     (custom-variable-tag-face ((t (:underline t :foreground "SteelBlue1"))))
     (cvs-filename-face ((t (:foreground "white"))))
     (cvs-handled-face ((t (:foreground "pink"))))
     (cvs-header-face ((t (:foreground "green"))))
     (cvs-marked-face ((t (:bold t :foreground "green3"))))
     (cvs-msg-face ((t (:foreground "red"))))
     (cvs-need-action-face ((t (:foreground "yellow"))))
     (cvs-unknown-face ((t (:foreground "grey"))))
     (diff-added-face ((t (nil))))
     (diff-changed-face ((t (nil))))
     (diff-file-header-face ((t (:bold t :background "grey70"))))
     (diff-hunk-header-face ((t (:background "grey85"))))
     (diff-index-face ((t (:bold t :background "grey70"))))
     (diff-removed-face ((t (nil))))
     (dired-face-boring ((t (:foreground "Gray65"))))
     (dired-face-directory ((t (:bold t :foreground "SkyBlue2"))))
     (dired-face-executable ((t (:foreground "Green"))))
     (dired-face-flagged ((t (:background "LightSlateGray"))))
     (dired-face-header ((t (:background "grey75" :foreground "black"))))
     (dired-face-marked ((t (:background "PaleVioletRed"))))
     (dired-face-permissions ((t (:background "grey75" :foreground "black"))))
     (dired-face-setuid ((t (:foreground "Red"))))
     (dired-face-socket ((t (:foreground "magenta"))))
     (dired-face-symlink ((t (:foreground "cyan"))))
     (excerpt ((t (nil))))
     (fixed ((t (:bold t))))
     (font-lock-builtin-face ((t (:foreground "red3"))))
     (font-lock-comment-face ((t (:foreground "LightGray"))))
     (font-lock-constant-face ((t (nil))))
     (font-lock-doc-string-face ((t (:foreground "turquoise"))))
     (font-lock-function-name-face ((t (:foreground "white"))))
     (font-lock-keyword-face ((t (:foreground "green"))))
     (font-lock-preprocessor-face ((t (:foreground "green3"))))
     (font-lock-reference-face ((t (:foreground "red3"))))
     (font-lock-string-face ((t (:foreground "turquoise"))))
     (font-lock-type-face ((t (:foreground "steelblue"))))
     (font-lock-variable-name-face ((t (:foreground "magenta2"))))
     (font-lock-warning-face ((t (:bold t :foreground "Red"))))
     (green ((t (:foreground "green"))))
     (gui-button-face ((t (:background "grey75" :foreground "black"))))
     (gui-element ((t (nil))))
     (highlight ((t (:background "darkseagreen2" :foreground "SteelBlue1"))))
     (html-helper-bold-face ((t (:bold t))))
     (html-helper-italic-face ((t (:bold t :foreground "yellow"))))
     (html-helper-underline-face ((t (:underline t))))
     (hyper-apropos-documentation ((t (:foreground "white"))))
     (hyper-apropos-heading ((t (:bold t))))
     (hyper-apropos-hyperlink ((t (:foreground "sky blue"))))
     (hyper-apropos-major-heading ((t (:bold t))))
     (hyper-apropos-section-heading ((t (:bold t))))
     (hyper-apropos-warning ((t (:bold t :foreground "red"))))
     (info-node ((t (:bold t :foreground "yellow"))))
     (info-xref ((t (:bold t))))
     (isearch ((t (:background "paleturquoise" :foreground "dark red"))))
     (isearch-secondary ((t (:foreground "red3"))))
     (italic ((t (:bold t :foreground "yellow"))))
     (left-margin ((t (nil))))
     (list-mode-item-selected ((t (:background "gray68" :foreground "dark green"))))
     (man-bold ((t (:bold t))))
     (man-heading ((t (:bold t))))
     (man-italic ((t (:foreground "yellow"))))
     (man-xref ((t (:underline t))))
     (message-cited-text ((t (:foreground "orange"))))
     (message-header-contents ((t (:foreground "white"))))
     (message-headers ((t (:bold t :foreground "orange"))))
     (message-highlighted-header-contents ((t (:bold t))))
     (message-url ((t (:bold t :foreground "pink"))))
     (mmm-face ((t (:background "black" :foreground "green"))))
     ; (modeline ((t (:background "LightYellow" :foreground "DarkBlue" :bold t))))
     ; (modeline-buffer-id ((t (:background "Gray80" :foreground "SteelBlue4"))))
     ; (modeline-mousable ((t (:background "Gray80" :foreground "firebrick"))))
     ; (modeline-mousable-minor-mode ((t (:background "Gray80" :foreground "green4"))))
     (paren-blink-off ((t (:foreground "gray80"))))
     (paren-match ((t (:background "dark blue"))))
     (paren-mismatch ((t (:background "DeepPink" :foreground "LightSkyBlue"))))
     (pointer ((t (nil))))
     (primary-selection ((t (:background "gray65" :foreground "DarkBlue"))))
     (red ((t (:foreground "red"))))
     (region ((t (:background "gray65" :foreground "DarkBlue"))))
     (right-margin ((t (nil))))
     (secondary-selection ((t (:background "paleturquoise" :foreground "black"))))
     (shell-option-face ((t (:foreground "SteelBlue4"))))
     (shell-output-2-face ((t (:foreground "green4"))))
     (shell-output-3-face ((t (:foreground "green4"))))
     (shell-output-face ((t (:bold t))))
     (shell-prompt-face ((t (:foreground "red4"))))
     (text-cursor ((t (:background "Red3" :foreground "black"))))
     (toolbar ((t (:background "Gray80" :foreground "black"))))
     (underline ((t (:underline t))))
     (vertical-divider ((t (nil))))
     (vm-xface ((t (:background "white" :foreground "black"))))
     (vmpc-pre-sig-face ((t (:foreground "forestgreen"))))
     (vmpc-sig-face ((t (:foreground "steelblue"))))
     (widget ((t (nil))))
     (widget-button-face ((t (:bold t))))
     (widget-button-pressed-face ((t (:foreground "red"))))
     (widget-documentation-face ((t (:foreground "dark green"))))
     (widget-field-face ((t (:background "gray85" :foreground "black"))))
     (widget-inactive-face ((t (:foreground "dim gray"))))
     (x-face ((t (:background "white" :foreground "black"))))
     (xrdb-option-name-face ((t (:foreground "red"))))
     (yellow ((t (:foreground "yellow"))))
     (nxml-name-face ((t (:foreground "LightBlue"))))
     (nxml-text-face ((t (:foreground "Heather"))))
       (nxml-comment-content-face ((t (:foreground "Gray80"))))
     (nxml-delimited-data-face ((t (:foreground "Heather"))))
     (zmacs-region ((t (:background "gray65")))))))
