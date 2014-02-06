;; Misc editing features.

;; This is supposed to enable text deletion of selected text like
;; everything else outside of EMACS, but doesn't?
(setq delete-selection-mode t)

;; Unix line endings by default
(setq default-buffer-file-coding-system 'utf-8-unix)

;; Smart home key
(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line."
  (interactive "^")
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))
(global-set-key (kbd "<home>") 'smart-beginning-of-line)
(global-set-key (kbd "C-a") 'smart-beginning-of-line)

;; Subword mode (consider CamelCase chunks as words)
(global-subword-mode 1)

(provide 'luminous-editing)
