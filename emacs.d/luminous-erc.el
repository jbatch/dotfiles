(require 'erc)

(load "~/.emacs.d/.erc-auth")

;; ERC Settings
(defadvice erc-track-find-face (around erc-track-find-face-promote-query activate)
  (if (erc-query-buffer-p)
      (setq ad-return-value (intern "erc-current-nick-face"))
    ad-do-it))

(setq erc-keywords '("LuminousMonkey" "Monkey" "Luminous"))

(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                "301" ; Away notice
                                "305" ; Return from awayness
                                "306" ; Set awayness
                                "332" ; Topic notice
                                "333" ; Who set the notice
                                "353" ; Names notice
                                "324" ; Modes
                                "329" ; Channel creation date
                                ))

(setq erc-track-exclude-server-buffer t)
(setq erc-track-exclude '("*stickychan" "*status"))
(setq erc-track-showcount t)
(setq erc-track-shorten-start 1)
(setq erc-track-switch-direction 'importance)
(setq erc-track-visibility 'selected-visible)

;; Be overly eager to identify URLs
(setq erc-button-url-regexp
      "\\([-a-zA-Z0-9_=!?#$@~`%&*+\\/:;,]+\\.\\)+[-a-zA-Z0-9_=!?#$@~`%&*+\\/:;,]*[-a-zA-Z0-9\\/]")

(provide 'luminous-erc)
