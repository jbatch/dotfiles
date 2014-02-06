;;; markup.el -- HTML and friends

;; Useful major modes
(package-require 'less-css-mode)

;; Colourise colour names in certain modes
(package-require 'rainbow-mode)
(dolist (mode '(css-mode less-css-mode html-mode nxhtml-mode nxhtml-mumamo-mode))
  (add-hook (intern (concat (symbol-name mode) "-hook"))
            (lambda () (rainbow-mode))))

;; ;; nXhtml
;; (autoload 'nxhtml-mumamo-mode "autostart" nil t)
;; (add-to-list 'auto-mode-alist '("\\.\\(html\\|ejs\\|jsp\\)$" . nxhtml-mumamo-mode))
;; (eval-after-load "nxhtml-mode"
;;   '(setq mumamo-chunk-coloring 1
;;      rng-nxml-auto-validate-flag nil
;;      nxhtml-skip-welcome t))

;; ;; Patch a mumamo bug which keeps giving annoying warnings
;; (eval-after-load "mumamo"
;;   '(setq mumamo-per-buffer-local-vars (delq 'buffer-file-name mumamo-per-buffer-local-vars)))

;; Some paredit for HTML
(package-require 'tagedit)
(eval-after-load "sgml-mode"
  '(progn
     (define-key sgml-mode-map (kbd "C-<right>") 'tagedit-forward-slurp-tag)
     (define-key sgml-mode-map (kbd "C-<left>") 'tagedit-forward-barf-tag)
     (define-key sgml-mode-map (kbd "M-k") 'tagedit-kill-attribute)
     (define-key sgml-mode-map (kbd "C-k") 'tagedit-kill)
     (define-key sgml-mode-map (kbd "M-r") 'tagedit-raise-tag)))

;; Key for renaming tags
(eval-after-load "sgml-mode"
  '(define-key sgml-mode-map (kbd "C-c C-r") 'mc/mark-sgml-tag-pair))

;; Launch a static web server in the current project root
(require 'luminous-magit)
(defun http-server-in-project (port)
  (interactive "nPort: ")
  (require 'projectile)
  (let ((default-directory (projectile-project-root)))
    (start-process "http.server" "*http.server*"
                   "python3" "-m" "http.server" (number-to-string port))))

;; Handlebars template support
(package-require 'handlebars-sgml-mode)
(eval-after-load "sgml-mode"
  '(progn
     (require 'handlebars-sgml-mode)
     (handlebars-use-mode 'minor)
     (define-key sgml-mode-map (kbd "C-c /") 'handlebars-sgml-close-tag)))
(add-to-list 'auto-mode-alist '("\\.hbs$" . html-mode))

(provide 'luminous-markup)
