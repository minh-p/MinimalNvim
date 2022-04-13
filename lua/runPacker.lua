--[[
    Author: minh-p, https://github.com/minh-p
    Purpose: Packer.nvim for plugin managment
--]]

local fn = vim.fn

-- auto-installing packer with some help from jdhao

local packageHome = fn.stdpath("data") .. "/site/pack/packer"
local packerInstallDir = packageHome .. "/start/packer.nvim"

local packerRepo = "https://github.com/wbthomason/packer.nvim"

local packerNotInstalled = fn.glob(packerInstallDir) == ""
if packerNotInstalled then
    vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
    -- basically inputing the command to download this chad of a plugin manager
    vim.cmd(
        string.format(
            "10split |term git clone --depth=1 %s %s",
            packerRepo,
            packerInstallDir
        )
    )
end

-- load packer.nvim
vim.cmd("packadd packer.nvim")

--// startup
local pluginList = require("user-config").plugins
return require "packer".startup(function()
    use 'wbthomason/packer.nvim'

    -- the benefit of doing this is now you only have to edit user-config.
    for i = 1, #pluginList do
        local pluginData = pluginList[i]
        use {
            pluginData.path,
            branch = pluginData.branch or "main",
            config = pluginData.config or function() end
        }
    end
end)
