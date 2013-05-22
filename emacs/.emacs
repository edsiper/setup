;; Org mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Org mode agenda files
(setq org-agenda-files (list "~/docs/org/monkey.org"
		             "~/docs/org/oracle.org"
		 	     "~/docs/org/home.org"))

(add-hook 'c-mode-common-hook
        (lambda ()
                (define-key c-mode-map [(ctrl tab)] 'complete-tag)))

(define-key global-map [f3] 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Linus' kernel formatting
(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (c-set-style "K&R")
  (setq tab-width 8)
  (setq indent-tabs-mode t)
  (setq c-basic-offset 8))

(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (> (x-display-pixel-width) 1280)
        (add-to-list 'default-frame-alist (cons 'width 120))
      (add-to-list 'default-frame-alist (cons 'width 80)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist
                 (cons 'height (/ (- (x-display-pixel-height) 200) (frame-char-height)))))))
(set-frame-size-according-to-resolution)

(require 'magit)
(require 'color-theme)
(load-file "~/emacs-themes/twilight-emacs/color-theme-twilight.el")
(color-theme-twilight)
(global-linum-mode)
(column-number-mode)
(setq-default indent-tabs-mode nil);
(setq default-tab-width 8);
(global-set-key [insert]    'overwrite-mode) ;
(global-set-key [kp-insert] 'overwrite-mode) ;
(global-set-key "\C-l" 'goto-line) ;
(set-scroll-bar-mode 'right)

;; Keybinding to change font size
(defun sacha/increase-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (ceiling (* 1.10
                                  (face-attribute 'default :height)))))
(defun sacha/decrease-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (floor (* 0.9
                                  (face-attribute 'default :height)))))
(global-set-key (kbd "C-+") 'sacha/increase-font-size)
(global-set-key (kbd "C--") 'sacha/decrease-font-size)
(set-face-attribute 'default
		     nil
		     :height
		     (floor (* 0.75
				  (face-attribute 'default :height))))

(setq load-path (cons "~/.emacs.d/site-lisp" load-path))
(autoload 'php-mode "php-mode" "PHP editing mode" t)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.php5\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.php4\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.php3\\'" . php-mode))


;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(85 50))
(add-to-list 'default-frame-alist '(alpha 85 50))
