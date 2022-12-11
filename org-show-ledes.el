(defun org-show-ledes (&optional arg)
  "Show all headings and the first paragraph in each body.
If ARG is omitted or nil, use an empty line as paragraph delimiter.
If ARG is non-nil, use the first linebreak."
  (interactive "P")
  (org-show-all '(headings drawers))
  (save-excursion
    (goto-char (point-max))
    (let ((regexp (if arg  "^\*+.*\n.*" "^\*+.*\\(?:\n.*\\)*?\n\n"))
          (last (point)))
      (while (re-search-backward regexp nil 't)
        (goto-char (match-end 0))
        (if arg (forward-line))
        (org-flag-region (point) last t 'outline)
        (goto-char (match-beginning 0))
        (forward-line -1)
        (setq last (point))))))
