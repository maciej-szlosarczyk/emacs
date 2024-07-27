# My emacs config

Contains config I use for the following languages/modes:

* Elixir
* Ruby
* Rust
* Markdown
* HTML and compatibile (ERB)

As of current iteration, I avoid usage of Evil modes, instead focusing of usage of Emacs functionality.

## Installation

```bash
git clone git@github.com:maciej-szlosarczyk/emacs.git ~/.emacs.d
```

And then put the following lines into init.el

```emacs
(require 'icejam-custom-init)
(provide 'init)
```
