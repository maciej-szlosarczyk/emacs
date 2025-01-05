# Emacs configuration

This is the repository of my emacs configuration that I use on both MacOS and Linux. There are some additional configuration properties to use with BSD when I was testing it, but it is best treated as abandoned.

I predominantly write Elixir, so that part is the most polished bit of the configuration but it also works for Ruby, Rust, Go, Javascript/Typescript and Kotlin. I use emacs for programming, so there is no org-mode, GTD, email or RSS here. I use deft to keep some programming notes here and there.

## Installation

```bash
git clone git@github.com:maciej-szlosarczyk/emacs.git ~/.emacs.d
```

And then put the following lines into init.el

```emacs
(require 'icejam-custom-init)
```
