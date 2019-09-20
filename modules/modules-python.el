(use-package python
  :ensure nil
  :config (setq python-shell-completion-native-enable nil
                python-indent-offset 4))

(use-package elpy
  :after python
  :init
  (elpy-enable)
  (when (require 'flycheck nil t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))
  (setq elpy-rpc-python-command "python3")
  (setq python-shell-interpreter "python3"
        python-shell-interpreter-args "--pylab=osx --pdb --nosep --classic"
        python-shell-prompt-regexp ">>>"
        python-shell-prompt-output-regexp ""
        python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
        python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))

(use-package py-autopep8
  :after python
  :hook (elpy-mode . py-autopep8-enable-on-save))

(use-package quickrun
  :general
  (global-leader
    "x" 'quickrun))

(provide 'modules-python)