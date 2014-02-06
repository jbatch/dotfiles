;; Covers all the LISPs I use, or hope to use.
(require 'luminous-defuns)
(require 'luminous-smartparens)

(setq luminous-lisp-modes
      '(emacs-lisp lisp clojure cider cider-repl))

(defun add-lisp-hook (func)
  "Add the given function to all Lisp modes."
  (add-hooks luminous-lisp-modes func))

;; Rainbow delimiters
;; **DECIDE** Do I like this?
(package-require 'rainbow-delimiters)
(require 'rainbow-delimiters)

;; Load paredit and rainbow delimiters on all my Lisp modes.
(add-lisp-hook 'smartparens-strict-mode)
(add-lisp-hook 'rainbow-delimiters-mode)

(sp-pair "(" ")" :wrap "M-(")
(sp-pair "[" "]" :wrap "M-[")
(sp-pair "{" "}" :wrap "M-{")
(sp-pair "\"" "\"" :wrap "M-\"")

;; Utility functiosn
(defun live-delete-and-extract-sexp ()
  "Delete the sexp and return it."
  (interactive)
  (let* ((begin (point)))
    (forward-sexp)
    (let* ((result (buffer-substring-no-properties begin (point))))
      (delete-region begin (point))
      result)))

(defun live-lisp-describe-thing-at-point ()
  "Show the documentation of the Elisp function and variable near point.
   This checks in turn:
     -- for a function name where point is
     -- for a variable name where point is
     -- for a surrounding function call"
  (interactive)
  (let (sym)
    ;; sigh, function-at-point is too clever.  we want only the first half.
    (cond ((setq sym (ignore-errors
                       (with-syntax-table emacs-lisp-mode-syntax-table
                         (save-excursion
                           (or (not (zerop (skip-syntax-backward "_w")))
                               (eq (char-syntax (char-after (point))) ?w)
                               (eq (char-syntax (char-after (point))) ?_)
                               (forward-sexp -1))
                           (skip-chars-forward "`'")
                           (let ((obj (read (current-buffer))))
                             (and (symbolp obj) (fboundp obj) obj))))))
           (describe-function sym))
          ((setq sym (variable-at-point)) (describe-variable sym)))))

(provide 'luminous-lisp)
