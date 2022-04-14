--[[
    Author: minh-p, https://github.com/minh-p
    Purpose: Lsp Config - loop through lsp directory and require the modules.
--]]

local languageServersInstalled = {"pyright", "lua-language-server", "vscode-html-language-server"}

for i = 1, #languageServersInstalled do
    require("lsp." .. languageServersInstalled[i])
end
