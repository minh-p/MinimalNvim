--[[
	Author: minh-p, https://github.com/minh-p
	Purpose: This file is where you are given all the options to configurate nvim.
--]]

--[[ Info about meta-accessors
vim.o: behaves like :let &{option-name}
vim.go: behaves like :let &g:{option-name}
vim.bo: behaves like :let &l:{option-name} for buffer-local options
vim.wo: behaves like :let &l:{option-name} for window-local options
-- ]]

local sets = {
	relativenumber = true,
	number = true,
    -- turn bell on if you are a masochist ha ha
    belloff = "all",
    clipboard = "unnamedplus", -- allow clipboarding from system
    -- I love the number 4 so should you???
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
    --exrc = true, --if you want neovim to use local-to-directory configs
    relativenumber = true,
    number = true,
    hlsearch = false,
    encoding = "utf-8",
    errorbells = false,
    vb = false,
    hidden = true,
    smartindent = true,
    smartcase = true,
    swapfile = false,
    backup = false,
    -- cache directory at least on linux is a better option honestly than the config directory.
    undodir = os.getenv("HOME") .. "/.cache/nvim/undodir",
    undofile = true,
    incsearch = true,
    -- colorcolumn is a good practice for code styling line length
    colorcolumn = "80",
    signcolumn = "yes",
    splitbelow = true,
    wrap = false,
    compatible = false,
    foldmethod = "manual",
    -- only vim chads use wildmenu. who uses telescope or fzf anyways?
    path = ".,/usr/include,,,**",
    wildmenu = true,
    spell = true,
    spelllang = "en"
}

local globals = {
    tokyonight_style="storm",
    tokyonight_transparent = true,
    tokyonight_transparent_sidebar = true,
}

local keybinds = {}

local plugins = {
    {path="folke/tokyonight.nvim", branch = "main"}
}

local o = {}

-- returning
return {
	sets = sets,
	globals = globals,
	keybinds = keybinds,
	colorschemeName = "tokyonight",
	o = o,
    plugins = plugins,
    isTransparent = true,
    file_type_plugin_on = true,
    no_terminal_numberline = true
}
