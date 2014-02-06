;;; Flyspell configuration

;;; Cygwin doesn't seem to have an en_AU dictionary
;;; Will need to check OSX at home.
(setq ispell-program-name "aspell"
      ispell-dictionary "british"
      ispell-extra-args '("--sug-mode=ultra")
      ispell-silently-savep t)

(add-hook 'ispell-initialize-spellchecker-hook
          (lambda ()
            (setq ispell-base-dicts-override-alist
                  '((nil ; default
                     "[A-Za-z]" "[^A-Za-z]" "[']" t
                     ("-d" "en_GB" "--encoding=utf-8") nil utf-8)
                    ("australian"
                     "[A-Za-z]" "[^A-Za-z]" "[']" t
                     ("-d" "en_AU" "--encoding=utf-8") nil utf-8)
                    ("american" ; Yankee English
                     "[A-Za-z]" "[^A-Za-z]" "[']" t
                     ("-d" "en_US" "--encoding=utf-8") nil utf-8)
                    ("british" ; British English
                     "[A-Za-z]" "[^A-Za-z]" "[']" t
                     ("-d" "en_GB" "--encoding=utf-8") nil utf-8)))))

(autoload 'flyspell-mode
  "flyspell" "On-the-fly spelling checker." t)

(provide 'luminous-spelling)
