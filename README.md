# My emacs config

Contains config I use for the following languages/modes:

* Elixir
* Ruby
* Rust
* HTML and compatibile (ERB)
* Markdown

## Installation

```bash
git clone git@github.com:maciej-szlosarczyk/emacs.git ~/.emacs.d
ln -s ~/.emacs.d/emacs ~/.emacs
```

## Selected packages

The following packages are included or required:

* Evil
* Magit
* Helm
* Projectile
* Company
* Yasnippet
* Column Enforce Mode
* Ag

## Compatibility notes

Tested on MacOS, requires additional packages such as ag (`the_silver_searcher`).

## TODO

1. Add and configure multiterm
  * Add `multi-term-mode-hook` for trailing whitespace.
