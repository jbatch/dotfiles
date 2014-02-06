(package-require 'smartparens)

(require 'smartparens-config)

(setq sp-highlight-pair-overlay nil)

;; Smartparens bindings
(stante-after smartparens
  (setq sp-autoskip-closing-pair 'always
        ;; Don't kill the entire symbol on C-k
        sp-hybrid-kill-entire-symbol nil)

  ;; Smartparens bindings
  (let ((map smartparens-mode-map))
    ;; Movement and navigation
    (define-key map (kbd "C-M-f") #'sp-forward-sexp)
    (define-key map (kbd "C-M-b") #'sp-backward-sexp)
    (define-key map (kbd "C-M-u") #'sp-backward-up-sexp)
    (define-key map (kbd "C-M-d") #'sp-down-sexp)
    (define-key map (kbd "C-M-p") #'sp-backward-down-sexp)
    (define-key map (kbd "C-M-n") #'sp-up-sexp)
    ;; Deleting and killing
    (define-key map (kbd "C-M-k") #'sp-kill-sexp)
    (define-key map (kbd "C-M-w") #'sp-copy-sexp)
    ;; Depth changing
    (define-key map (kbd "M-s") #'sp-splice-sexp)
    (define-key map (kbd "M-<up>") #'sp-splice-sexp-killing-backward)
    (define-key map (kbd "M-<down>") #'sp-splice-sexp-killing-forward)
    (define-key map (kbd "M-r") #'sp-splice-sexp-killing-around)
    (define-key map (kbd "M-?") #'sp-convolute-sexp)
    ;; Barfage & Slurpage
    (define-key map (kbd "C-)")  #'sp-forward-slurp-sexp)
    (define-key map (kbd "C-<right>") #'sp-forward-slurp-sexp)
    (define-key map (kbd "C-}")  #'sp-forward-barf-sexp)
    (define-key map (kbd "C-<left>") #'sp-forward-barf-sexp)
    (define-key map (kbd "C-(")  #'sp-backward-slurp-sexp)
    (define-key map (kbd "C-M-<left>") #'sp-backward-slurp-sexp)
    (define-key map (kbd "C-{")  #'sp-backward-barf-sexp)
    (define-key map (kbd "C-M-<right>") #'sp-backward-barf-sexp)
    ;; Miscellaneous commands
    (define-key map (kbd "M-S") #'sp-split-sexp)
    (define-key map (kbd "M-J") #'sp-join-sexp)
    (define-key map (kbd "C-M-t") #'sp-transpose-sexp))

  ;; Some additional bindings for strict mode
  (let ((map smartparens-strict-mode-map))
    (define-key map (kbd "M-q") #'sp-indent-defun)
    (define-key map (kbd "C-j") #'sp-newline)))

;; Add newline and position cursor appropriately when starting a
;; curly brace block in C like modes
(defun sp--my-create-newline-and-enter-sexp (&rest _ignored)
  "Open a new brace or bracket expression, with relevant newlines and indent. "
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))

(sp-with-modes '(c-mode c++-mode js-mode js2-mode java-mode
                        typescript-mode perl-mode)
  (sp-local-pair "{" nil :post-handlers
                 '((sp--my-create-newline-and-enter-sexp "RET"))))

;; Use it everywhere!
(smartparens-global-mode t)

(provide 'luminous-smartparens)
