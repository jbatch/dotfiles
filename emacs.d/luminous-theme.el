;; Let's see what we're running on
(setq on-console (null window-system))

;; No splash screen, no messages that we don't read.
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; Don't let Emacs hurt your ears.
(setq visible-bell t)

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

;; Prevent cursor from blinking.
(blink-cursor-mode 0)

;; Some X11 setup
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (setq ns-use-srgb-colorspace t))

;; Set custom theme path
(setq custom-theme-directory (concat dotfiles-dir "themes"))
(dolist
    (path (directory-files custom-theme-directory t "\\w+"))
  (when (file-directory-p path)
    (add-to-list 'custom-theme-load-path path)))

;;; My colour theme
(load-theme 'jellybeans t)

;; Show column numbers in modeline
(setq column-number-mode t)

;; Highlight matching parens
(package-require 'mic-paren)
(paren-activate)

;; Font used depends on OS I'm running on
(cond
 ((and (window-system) (eq system-type 'darwin))
  (setq my-font-to-use "Menlo"))
 ((display-graphic-p)
  (setq my-font-to-use "Menlo for Powerline")))

;; Set default font only if windowing system
(if (window-system)
  (custom-set-faces `(default ((t (:height 150 :family ,my-font-to-use :embolden t))))))

(package-require 'diminish)
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "ethan-wspace" '(diminish 'ethan-wspace-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "rainbow-mode" '(diminish 'rainbow-mode))
(eval-after-load "smartparens" '(diminish 'smartparens-mode))
(eval-after-load "autopair" '(diminish 'autopair-mode))
(eval-after-load "abbrev" '(diminish 'abbrev-mode))
(eval-after-load "auto-complete" '(diminish 'auto-complete-mode))
(eval-after-load "js2-highlight-vars" '(diminish 'js2-highlight-vars-mode))
(eval-after-load "projectile" '(diminish 'projectile-mode))
(eval-after-load "mmm-mode" '(diminish 'mmm-mode))
(eval-after-load "skewer-html" '(diminish 'skewer-html-mode))
(eval-after-load "auto-indent-mode" '(diminish 'auto-indent-minor-mode))
(eval-after-load "highlight-parentheses" '(diminish 'highlight-parentheses-mode))
;;(eval-after-load "subword" '(diminish 'subword-mode))

(eval-after-load "js2-mode"
  '(defadvice js2-mode (after js2-rename-modeline activate)
     (setq mode-name "JS+")))
(eval-after-load "clojure-mode"
  '(defadvice clojure-mode (after clj-rename-modeline activate)
     (setq mode-name "Clj")))
(eval-after-load "typescript"
  '(defadvice typescript-mode (after typescript-rename-modeline activate)
     (setq mode-name "TS")))
(eval-after-load "nxhtml-mode"
  '(defadvice nxhtml-mode (after nxhtml-rename-modeline activate)
     (setq mode-name "HTML")))
(eval-after-load "js"
  '(defadvice js-mode (after js-rename-modeline activate)
     (setq mode-name "JS")))
(defadvice emacs-lisp-mode (after elisp-rename-modeline activate)
  (setq mode-name "ELisp"))

;; Powerline
(package-require 'powerline)
(defun powerline-luminous-theme ()
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1
                                   'powerline-inactive1))
                          (face2 (if active 'powerline-active2
                                   'powerline-inactive2))
                          (separator-left
                           (intern (format "powerline-%s-%s"
                                           powerline-default-separator
                                           (car powerline-default-separator-dir))))
                          (separator-right
                           (intern (format "powerline-%s-%s"
                                           powerline-default-separator
                                           (cdr powerline-default-separator-dir))))
                          (lhs (list
                                (powerline-raw "%*%*" nil 'l)
                                (powerline-buffer-id nil 'l)

                                (when (and (boundp 'which-func-mode) which-func-mode)
                                  (powerline-raw which-func-format nil 'l))

                                (powerline-raw " ")
                                (funcall separator-left mode-line face1)

                                (when (boundp 'erc-modified-channels-object)
                                  (powerline-raw erc-modified-channels-object
                                                 face1 'l))

                                (powerline-major-mode face1 'l)
                                (powerline-process face1)
                                (powerline-minor-modes face1 'l)
                                (powerline-narrow face1 'l)

                                (powerline-raw " " face1)
                                (funcall separator-left face1 face2)

                                (powerline-vc face2 'r)))
                          (rhs (list
                                (powerline-raw global-mode-string face2 'r)

                                (funcall separator-right face2 face1)

                                (powerline-raw "%4l" face1 'l)
                                (powerline-raw ":" face1 'l)
                                (powerline-raw "%3c" face1 'r)

                                (funcall separator-right face1 mode-line)
                                (powerline-raw " ")

                                (powerline-raw "%6p" nil 'r)
                                (powerline-hud face2 face1))))
                     (concat
                      (powerline-render lhs)
                      (powerline-fill face2 (powerline-width rhs))
                      (powerline-render rhs)))))))
(powerline-luminous-theme)

;;; HL Line mode
(global-hl-line-mode 1)

;;; Face List
;;; Lists all the defined font colours, etc for theming.
(require 'face-list)

(provide 'luminous-theme)
