# Minh's minimal Neovim config.
## Preamble
* A lot of people says why the hell I keep configuring my tools.
* I have no idea either.
* I have a pretty rounded configuration already but it doesn't feel good as I use so many plugins.
* I want to use as little as plugins possible in this configuration.
* You know, probably the minimal it would get is just a color scheme.
	* It's gonna be full feature though: with nvim-lsp and other stuff that is not about looking cool.
## Source of Inspiration
This video pretty much inspired me: https://youtube.com/watch?v=XA2WjJbmmoM
The speaker (I think) is Max.
## Explanation of Workflow
The video linked above showed how to do things without plugins.
* In the video, here are some of them:
    1. [Basic Setup](https://github.com/minh-p/nvim_config_minimal#basic-setup)
    2. [Fuzzy File Search](https://github.com/minh-p/nvim_config_minimal#fuzzy-file-search)
    3. Tag jumping
    4. File Browsing
    5. Snippets
    4. Build Integration
* I also include other things in here:
    1. Color schemes by using Packer.nvim as the plugin manager.
    2. Spell checking (which is very easy to implement).

### Before you get started.
My configuration has its own system to manage all of the options (or sets) or globals...
The things below is just a guide on how to do this on your own.

### Basic Setup
Here is the basic setup

```vim
" First, makes this only work for vim
set nocompatible

"enable syntax highlighting
syntax enable
filetype plugin on
```

```lua
vim.opt.nocompatible = true
vim.cmd("syntax enable")
vim.cmd("filetype plugin on")
```

### Fuzzy File Search
For this part, you are going to have to enable wildmenu and as well as adding ** to path.
```vim
set path +=**
set wildmenu
```
For lua, it is a bit trickier. You can enable wildmenu easily. But, for the path you can either use vim.cmd or
manually find the path (by seeing the output of :set path) and then appending ** after it with a comma (at least that is what in linux).
```lua
vim.opt.path = ".,/usr/include,,,**"
vim.opt.wildmenu = true
```
