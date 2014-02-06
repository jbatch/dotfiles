;;; My default bindings

;; Steve Yegge recommendations for EMACS.
(define-key global-map (kbd "C-x C-m") 'execute-extended-command)
(define-key global-map (kbd "C-w ") 'backward-kill-word)
(define-key global-map (kbd "C-x C-k") 'kill-region)
(define-key global-map (kbd "C-c C-k") 'kill-region)

;; C-c <group>
;;
;; w - Window and buffer shortcuts

(package-require 'buffer-move)
(require 'buffer-move)
(require 'luminous-defuns)

;;window and buffer movement
(global-set-key (kbd "C-c w s") 'swap-windows)
(global-set-key (kbd "C-c w r") 'rotate-windows)
(global-set-key (kbd "C-c w p") 'buf-move-up)
(global-set-key (kbd "C-c w n") 'buf-move-down)
(global-set-key (kbd "C-c w b") 'buf-move-left)
(global-set-key (kbd "C-c w f") 'buf-move-right)
(global-set-key (kbd "C-c w .") 'shrink-window-horizontally)
(global-set-key (kbd "C-c w ,") 'enlarge-window-horizontally)
(global-set-key (kbd "C-c w /") (lambda () (interactive) (enlarge-window -1)))
(global-set-key (kbd "C-c w '") (lambda () (interactive) (enlarge-window 1)))

;; Window switching.
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward two

;; Show documentation/information with M-RET
(define-key lisp-mode-shared-map (kbd "M-RET") 'live-lisp-describe-thing-at-point)
(define-key cider-repl-mode-map (kbd "M-RET") 'cider-doc)
(define-key cider-mode-map (kbd "M-RET") 'cider-doc)

(provide 'luminous-bindings)
