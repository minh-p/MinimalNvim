--[[
    Author: minh-p, https://github.com/minh-p
    Purpose: Lsp Config - loop through lsp directory and require the modules.
--]]

-- Edit the servers:
local languageServersInstalled = {"pyright", "lua-language-server", "vscode-html-language-server"}

-- For each server, there will be a lua file to set it up inside the lsp directory.
-- Be sure to install the lsps!
for i = 1, #languageServersInstalled do
    require("lsp." .. languageServersInstalled[i])
end
