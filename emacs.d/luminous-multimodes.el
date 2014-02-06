;;; mmm-mode config

(package-require 'mmm-mode)
(require 'mmm-mode)
(setq mmm-global-mode 1)

;; Define active classes
(setq mmm-mode-ext-classes-alist
      '(;; JS inside HTML
        (html-mode nil html-js)
        ;; CSS inside HTML
        (html-mode nil html-css)
        ;; PHP and HTML
        (html-mode "\\.php\\'" 'html-php)
        ))

;; Prefer js2-mode for inline JS
(mmm-add-to-major-mode-preferences 'javascript 'js2-mode t)

(provide 'luminous-multimodes)
