# Minh's minimal Neovim config.
This is a work-in-progress
## Preamble
* A lot of people says why the hell I keep configuring my tools.
* I have no idea either.
* I have a pretty rounded configuration already but it doesn't feel good as I use so many plugins.
* I want to use as little as plugins possible in this configuration.
* You know, probably the minimal it would get is just a color scheme.
	* It's gonna be full feature though: with nvim-lsp and other stuff that is not about looking cool.
## Source of Inspiration
This video pretty much inspired me: https://youtube.com/watch?v=XA2WjJbmmoM
The speaker is Max Cantor.
- Be sure to watch this video to look for the technical details
- Here is the presentation: https://github.com/changemewtf/no_plugins/blob/master/no_plugins.vim
## Explanation of Workflow
The video linked above showed how to do things without plugins.
* In the video, here are some of them:
    1. [Basic Setup](https://github.com/minh-p/nvim_config_minimal#basic-setup)
    2. [Fuzzy File Search](https://github.com/minh-p/nvim_config_minimal#fuzzy-file-search)
    3. Tag jumping
    4. File Browsing
* I also include other things in here:
    1. Color schemes by using Packer.nvim as the plugin manager.
    2. Spell checking (which is very easy to implement).

### Before you get started.
My configuration has its own system to manage all of the options (or sets) or globals...
The things below are just a guide on how to do this on your own.

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
After this, you can now use the find command with tab for autocomplete
```
:find <FILE>
```
```
:find *<WildcardInput>
:find *.<WildcardInputExtension>
```

### Tag Jumping
Firstly, be sure to have ctags installed first on your machine.
* Neovim Lua is still being implemented. If there is an option to replace I would do that.
```vim
command! MakeTags !ctags -R .
```
```lua
vim.cmd("command! MakeTags !ctags -R .")
```
* Usage:
    * Use ^] to jump to tag under cursor
    * Use g^] for ambiguous tags
    * Use ^t to jump back up the tag stack
### File Browsing
Here are some globals that improve the quality of life in file-browsing with netrw:
```vim
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
```
```lua
vim.opt.netrw_banner=true
vim.opt.netrw_browse_split=4
vim.opt.netrw_altv=1
vim.opt.netrw_liststyle=3
vim.cmd [[
    let g:netrw_list_hide=netrw_gitignore#Hide()
    let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
]]
```
* <CR>/v/t to open in an h-split/v-split/tab
* check |netrw-browse-maps| for more mappings
