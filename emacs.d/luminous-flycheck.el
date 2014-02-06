(package-require 'flycheck)

(add-hook 'find-file-hook
          (lambda ()
            (when (not (equal 'emacs-lisp-mode major-mode))
              (flycheck-mode))))

(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)

(package-require 'flycheck-color-mode-line)
(package-require 'flycheck-tip)

(setq flycheck-display-errors-function nil)

(provide 'luminous-flycheck)
