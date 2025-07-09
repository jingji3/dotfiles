-- カスタムキーマップ
vim.keymap.set('i', 'jj', '<ESC>', { silent = true })
vim.keymap.set('n', ';', ':', { silent = true })

-- クリップボード連携
vim.keymap.set('n', '<leader>y', '"+yy', { desc = '一列をコピーする' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Copy selection to clipboard' })
vim.keymap.set('n', '<leader>d', '"+dd', { desc = 'Cut line to clipboard' })
vim.keymap.set('v', '<leader>d', '"+d', { desc = 'Cut selection to clipboard' })

-- ウィンドウ操作
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split vertically' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split horizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Equal windows' })
vim.keymap.set('n', '<leader>sx', ':close<CR>', { desc = 'Close window' })

-- 単語を引用符で囲う
vim.keymap.set('n', '<leader>aw', 'ciw""<Esc>P', { desc = 'Wrap word in double quotes' })
vim.keymap.set('n', '<leader>aW', "ciw''<Esc>P", { desc = 'Wrap word in single quotes' })
