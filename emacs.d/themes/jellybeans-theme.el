(deftheme jellybeans
  "Emacs conversion of the Jellybeans VIM colour theme.")

(let ((*background* "#151515")
      (*normal* "#E8E8D3")
      (*cursor* "#B0D0F0")
      (*line-hl* "#1C1C1C")

      (*comment* "#888888")
      (*constant* "#CF6A4C")

      (*string* "#99AD6A")
      (*variable* "#C6B6EE")
      (*function* "#FAD07A")
      (*builtin* "#8197BF")
      (*type* "#FFB964")
      (*keyword* "#C6B6FE")
      (*regex* "#E9C062")

      (*buffer-id* "#16C0FF")
      (*buffer-id-text* "#0E8DC8")

      (*preprocessor* "#8FBFDC")

      (*gradient-1*   "#729fcf")  ;; sky-blue-1
      (*gradient-2*   "#8ae234")  ;; chameleon-1
      (*gradient-3*   "#fce94f")  ;; butter-1
      (*gradient-4*   "#ad7fa8")  ;; plum-1
      (*gradient-5*   "#e9b96e")  ;; chocolate-1
      (*gradient-6*   "#fcaf3e")  ;; orange-1
      (*gradient-7*   "#3465a4")  ;; sky-blue-2
      (*gradient-8*   "#73d216")  ;; chameleon-2
      (*gradient-9*   "#f57900")  ;; orange-2
      (*gradient-10*  "#75507b")  ;; plum-2
      (*gradient-11*  "#c17d11")  ;; chocolate-2

      (*black* "#000000")

      (*butter-1* "#fce94f")
      (*butter-2* "#edd400")
      (*butter-3* "#c4a000")

      (*orange-1*  "#fcaf3e")
      (*orange-2*  "#f57900")
      (*orange-3*  "#ce5c00")

      (*chocolate-1*  "#e9b96e")
      (*chocolate-2*  "#c17d11")
      (*chocolate-3*  "#9f5902")

      (*chameleon-1*  "#8ae234")
      (*chameleon-2*  "#73d216")
      (*chameleon-3*  "#4e9a06")

      (*sky-blue-1*  "#729fcf")
      (*sky-blue-2*  "#3465a4")
      (*sky-blue-3*  "#204a87")

      (*scarlet-red-1*  "#ef2929")
      (*scarlet-red-2*  "#cc0000")
      (*scarlet-red-3*  "#a40000"))

  (let ((bg-back `(:background ,*background*))
        (bg-cursor `(:background ,*cursor*))
        (bg-line-highlight `(:background ,*line-hl*))
        (bg-buffer-id `(:background ,*buffer-id*))

        (fg-normal `(:foreground ,*normal*))
        (fg-comment `(:foreground ,*comment*))
        (fg-constant `(:foreground ,*constant*))
        (fg-string `(:foreground ,*string*))
        (fg-variable `(:foreground ,*variable*))
        (fg-function `(:foreground ,*function*))
        (fg-builtin `(:foreground ,*builtin*))
        (fg-type `(:foreground ,*type*))
        (fg-keyword `(:foreground ,*keyword*))
        (fg-regex `(:foreground ,*regex*))

        (fg-buffer-id `(:foreground "black"))

        (fg-preprocessor `(:foreground ,*preprocessor*))

        (fmt-none `(:weight normal :slant normal  :underline nil :inverse-video nil))
        (fmt-ital `(:weight normal :slant italic :underline nil  :inverse-video nil))
        (fmt-stnd `(:weight normal :slant normal  :underline nil :inverse-video t)))

    (cl-flet ((color (fgcolor &optional (bgcolor nil) (bold nil) (italic nil) (underline nil))
                  `((t (,@(if fgcolor   `(:foreground ,fgcolor))
                        ,@(if bgcolor   `(:background ,bgcolor))
                        ,@(if bold      '(:bold       t))
                        ,@(if italic    '(:italic     t))
                        ,@(if underline '(:underline  t))))))
           (face (face &rest args)
                 `(,(intern (concat "font-lock-" face "-face"))
                   ,(apply #'color args))))

      ;; Set faces
      (custom-theme-set-faces
       'jellybeans
       `(default ((t (,@bg-back ,@fg-normal ))))
       `(cursor ((t (,@bg-cursor))))

       `(fringe ,(color *normal* *background*))
       `(hl-line ,(color nil *line-hl*)) ;; This is a minor mode

       `(isearch ,(color "magenta" "#302028" nil nil t))
       `(lazy-highlight ,(color "#F0A0C0" "#302028"))

       `(mode-line ((t (,@bg-buffer-id :foreground "black" :box nil))))
       `(mode-line-inactive ((t (:background "#2A2A2A" :foreground "black" :box nil))))

       `(minibuffer-prompt ,(color "#8FBFDC" nil t))

       `(powerline-active1 ,(color nil "#0E8DC8"))
       `(powerline-active2 ,(color *black* "#FFB964"))

       ;; Font Lock
       `(font-lock-builtin-face ((t (,@fmt-none ,@fg-builtin))))
       `(font-lock-comment-face ((t (,@fmt-ital ,@fg-comment))))
       `(font-lock-constant-face ((t (,@fmt-none ,@fg-constant))))

       `(font-lock-string-face ((t (,@fmt-none ,@fg-string))))
       `(font-lock-type-face ((t (,@fmt-none ,@fg-type))))
       `(font-lock-variable-name-face ((t (,@fmt-none ,@fg-variable))))
       `(font-lock-function-name-face ((t (,@fmt-none ,@fg-function))))
       `(font-lock-keyword-face ((t (,@fmt-none ,@fg-keyword))))

       `(font-lock-preprocessor-face ((t (,@fmt-none ,@fg-preprocessor))))

       `(show-paren-match ((t (:foreground "#ffffff" :background "#80a090"))))
       `(show-paren-match-face ((t (:foreground "#ffffff" :background "#80a090"))))
       `(paren-face-match ((t (:foreground "#ffffff" :background "#80a090"))))

       ;; Smartparens
       `(sp-pair-overlay-face ((t (:foreground "#ffffff" :background "#729fcf"))))

       ;; Bright green until I can figure out colours.
       `(sp-wrap-overlay-face ((t (:foreground "#00ff00"))))
       `(sp-wrap-tag-overlay-face ((t (:foreground "#00ff00"))))

       ;; Clojure
       `(clojure-parens ((t (:foreground "#A3A3A3"))))
       `(clojure-braces ((t (:foreground "#DF8787"))))
       `(clojure-brackets ((t (:foreground "#729FCF"))))
       `(clojure-keyword ((t (,@fg-constant))))
       `(clojure-double-quote ((t (:foreground "#336633"))))
       `(clojure-special ((t (:foreground "#E18964"))))
       `(clojure-java-call ((t (:foreground "#FCAF3E"))))
       `(clojure-number ((t (:foreground "#FF73FD"))))
       `(clojure-regex ((t (,@fg-regex))))

       ;; Flyspell
       `(flyspell-incorrect ((t (:foreground nil :underline
                                             (:style wave :color ,*scarlet-red-1*)))))
       `(flyspell-duplicate ((t (:foreground nil :underline
                                             (:style wave :color ,*orange-1*)))))

       ;; Flymake
       `(flymake-errline ((t (:foreground nil :underline
                                          (:style wave :color ,*scarlet-red-1*)))))

       `(flymake-warnline ((t (:foreground nil :underline
                                           (:style wave :color ,*orange-1*)))))

       ;; Flycheck
       `(flycheck-error ((t (:foreground nil :underline
                                         (:style wave :color ,*scarlet-red-1*)))))

       `(flycheck-warning ((t (:foreground nil :underline
                                           (:style wave :color ,*orange-1*)))))

       `(flycheck-info ((t (:foreground nil :underline
                                        (:style wave :color ,*sky-blue-1*)))))

       `(flycheck-fringe-error ((t (:foreground ,*scarlet-red-1* :weight bold))))

       `(flycheck-fringe-warning ((t (:foreground ,*orange-1* :weight bold))))

       `(flycheck-fringe-info ((t (:foreground ,*sky-blue-1* :weight bold))))

       ;; Org-Mode
       `(org-level-1 ,(color *gradient-1* nil t))
       `(org-level-2 ,(color *gradient-2* nil t))
       `(org-level-3 ,(color *gradient-3* nil t))
       `(org-level-4 ,(color *gradient-4* nil t))
       `(org-level-5 ,(color *gradient-5* nil t))
       `(org-level-6 ,(color *gradient-6* nil t))
       `(org-level-7 ,(color *gradient-7* nil t))
       `(org-level-8 ,(color *gradient-8* nil t))

       `(org-mode-line-clock ())
       `(org-mode-line-clock-overrun ,(color *scarlet-red-1*))
       `(org-document-title ,(color *sky-blue-1* nil t))
       `(org-document-info ,(color *sky-blue-1* nil nil t))
       `(org-todo ,(color *scarlet-red-2*))
       `(org-done ,(color *chameleon-3*))
       `(org-scheduled ,(color *chameleon-2*))
       `(org-scheduled-previously ,(color *orange-2*))
       `(org-scheduled-today ,(color *chameleon-1*))
       `(org-date ,(color *chocolate-1*))

       `(org-column ,(color nil *background*))

       `(org-agenda-date ,(color *butter-1*))
       `(org-agenda-date-today ,(color *butter-2*))
       `(org-agenda-date-tc ,(color *butter-3*))
       `(org-agenda-date-weekend ,(color *scarlet-red-1*))

       `(org-habit-clear-future-face ,(color nil *sky-blue-3*))
       `(org-habit-clear-face ,(color nil *sky-blue-2*))
       `(org-habit-ready-future-face ,(color nil *chameleon-3*))
       `(org-habit-ready-face ,(color *black* *chameleon-2*))
       `(org-habit-alert-ready-future-face ,(color nil *orange-3*))
       `(org-habit-overdue-face ,(color nil *scarlet-red-3*))
       `(org-habit-overdue-future-face ,(color nil *scarlet-red-3*))

       ;; Rainbow delimiters
       `(rainbow-delimiters-depth-1-face ,(color *gradient-1*))
       `(rainbow-delimiters-depth-2-face ,(color *gradient-2*))
       `(rainbow-delimiters-depth-3-face ,(color *gradient-3*))
       `(rainbow-delimiters-depth-4-face ,(color *gradient-4*))
       `(rainbow-delimiters-depth-5-face ,(color *gradient-5*))
       `(rainbow-delimiters-depth-6-face ,(color *gradient-6*))
       `(rainbow-delimiters-depth-7-face ,(color *gradient-7*))
       `(rainbow-delimiters-depth-8-face ,(color *gradient-8*))
       `(rainbow-delimiters-depth-9-face ,(color *gradient-9*))
       `(rainbow-delimiters-depth-10-face ,(color *gradient-10*))
       `(rainbow-delimiters-depth-11-face ,(color *gradient-11*))
       `(rainbow-delimiters-depth-12-face ,(color *gradient-1*))
       `(rainbow-delimiters-unmatched-face ,(color *black* *butter-3*))

       ;; Multiterm
       `(term-color-blue ((t (:foreground "#268bd2"))))
       `(term-color-cyan ((t (:foreground "#2aa198"))))
       `(term-color-green ((t (:foreground "#859900"))))
       `(term-color-magenta ((t (:foreground "#d33682"))))
       `(term-color-red ((t (:foreground "#dc322f"))))
       `(term-color-white ((t (:foreground "#eee8d5"))))
       `(term-color-yellow ((t (:foreground "#b58900"))))))))

(provide-theme 'jellybeans)
