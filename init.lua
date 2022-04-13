--[[
	Author: minh-p, https://github.com/minh-p
	Purpose: This file acts as the intermeditary in processing the user-config.lua file, communicating options changes with neovim.
		As well as other things
--]]

local userConfig = require("user-config")

--// manages the sets
local set = vim.opt
local sets = userConfig.sets

-- This is pretty simple, just run a for loop and then use lua syntax to set stuff
for setName, setValue in pairs(sets) do
	set[setName] = setValue
end

--// manages the global vars
local global = vim.g
local globals = userConfig.globals
-- This is the same as the last for loop
for globalName, globalVal in pairs(globals) do
	global[globalName] = globalVal
end

--// set colorscheme
local colorschemeName = userConfig.colorschemeName
if colorschemeName and not (colorschemeName == "") then
	vim.cmd("colorscheme " .. colorschemeName)
end

--// managing plugins with packer.nvim. I am going to use a separate module for this
require("runPacker")
