;;; buffer-move-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (buf-move-right buf-move-left buf-move-down buf-move-up)
;;;;;;  "buffer-move" "../../../../.emacs.d/elpa/buffer-move-20130923.1653/buffer-move.el"
;;;;;;  "c9f9f4b29f02cfbd9be0222ec68f5e3c")
;;; Generated autoloads from ../../../../.emacs.d/elpa/buffer-move-20130923.1653/buffer-move.el

(autoload 'buf-move-up "buffer-move" "\
Swap the current buffer and the buffer above the split.
If there is no split, ie no window above the current one, an
error is signaled.

\(fn)" t nil)

(autoload 'buf-move-down "buffer-move" "\
Swap the current buffer and the buffer under the split.
If there is no split, ie no window under the current one, an
error is signaled.

\(fn)" t nil)

(autoload 'buf-move-left "buffer-move" "\
Swap the current buffer and the buffer on the left of the split.
If there is no split, ie no window on the left of the current
one, an error is signaled.

\(fn)" t nil)

(autoload 'buf-move-right "buffer-move" "\
Swap the current buffer and the buffer on the right of the split.
If there is no split, ie no window on the right of the current
one, an error is signaled.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/buffer-move-20130923.1653/buffer-move-pkg.el"
;;;;;;  "../../../../.emacs.d/elpa/buffer-move-20130923.1653/buffer-move.el")
;;;;;;  (21240 14064 319272 988000))

;;;***

(provide 'buffer-move-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; buffer-move-autoloads.el ends here
