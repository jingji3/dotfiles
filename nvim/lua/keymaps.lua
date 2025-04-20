-- クリップボード連携のキーマップ

-- 行をクリップボードにコピー
vim.keymap.set('n', '<leader>y', '"+yy', { desc = 'Copy line to clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Copy selection to clipboard' })

-- 行をクリップボードにコピーし、選択範囲を切り取る
vim.keymap.set('n', '<leader>d', '"+dd', { desc = 'Cut line to clipboard' })
vim.keymap.set('v', '<leader>d', '"+d', { desc = 'Cut selection to clipboard' })

vim.keymap.set('n', '<leader>o', '<CMD>Oil --float<CR>', { desc = 'Open Oil file explorer' })
