-- ftplugin/eruby.lua
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2

-- ERBファイルがHTML形式として認識されるように設定
vim.bo.filetype = "eruby"
vim.bo.syntax = "eruby"

-- ERBタグの自動補完
vim.keymap.set("i", "<%", "<%  %><Left><Left><Left>", { buffer = true })
vim.keymap.set("i", "<%=", "<%=  %><Left><Left><Left>", { buffer = true })
