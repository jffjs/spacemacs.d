(defvar js-extra-packages
  '(
    jsx-mode))

(defun js-extra/init-jsx-mode ()
  (use-package jsx-mode))
    ;; :init
    ;; (progn
    ;;   (add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
    ;;   (add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-mode)))))
