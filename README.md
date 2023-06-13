# About
This repo is an nvim custom configuration that was created to understand the underlaying ways 
in which nvim nvim works.

The objective of this repo is also to create a minimal nvim environment that can be used
for personal projects on this account.

## Plugins installed
I'm using lazy nvim as a package manager and as of now the plugins installed are as follows:
* `nvim-tree`
* `nvim-cmp`
* `nvim-lsp`
* `mason`
* `mason-lspconfig`
* `telescope`
* `catpuccin`
* `bufferline`
* `treesitter`

## Other VIM like configurations
I added a subfolder that will have some common configurations for other tools that
integrate somewhat with vim. The idea is that the same commands configured for regular
.nvim have an equivalent on these other tools

* `.ideavimrc` will hold the configrations for all JetBrains IDE that can use the idea vim 
plugin. A symlink can be used to direct this to the home folder.
