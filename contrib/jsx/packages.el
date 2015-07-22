(defvar jsx-packages
  '(
    web-mode
    flycheck
    ))

(defun jsx/init-web-mode ()
  (use-package web-mode
    :defer t
    :mode
    (("\\.jsx\\'" . web-mode))
    :config
    (progn
      (defadvice web-mode-highlight-part (around tweak-jsx activate)
        (if (equal web-mode-content-type "jsx")
            (let ((web-mode-enable-part-face nil))
              ad-do-it)
          ad-do-it)))))

(defun jsx/init-flycheck ()
  (use-package flycheck
    :defer t
    :config
    (progn
      (flycheck-add-mode 'javascript-eslint 'web-mode))))
