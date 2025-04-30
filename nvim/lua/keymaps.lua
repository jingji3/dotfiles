-- クリップボード連携のキーマップ

-- 行をクリップボードにコピー
vim.keymap.set('n', '<leader>y', '"+yy', { desc = 'Copy line to clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Copy selection to clipboard' })

-- 行をクリップボードにコピーし、選択範囲を切り取る
vim.keymap.set('n', '<leader>d', '"+dd', { desc = 'Cut line to clipboard' })
vim.keymap.set('v', '<leader>d', '"+d', { desc = 'Cut selection to clipboard' })

-- Telescopeのキーマップ
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "ファイル検索" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "テキスト検索" })
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Help Tags" })

-- lazygitのキーマップ
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open LazyGit" })

-- ターミナルモードでのカスタムキーマッピング
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], {desc = "Exit terminal mode"})
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], {desc = "Move to left window"})
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], {desc = "Move to down window"})
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], {desc = "Move to up window"})
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], {desc = "Move to right window"})

vim.keymap.set('i', 'jj', '<ESC>', {silent=true}) -- インサートモードを抜ける
vim.keymap.set('n', ';', ':', {silent=true}) -- シフトを押すことなく、;を入力する。割と便利

vim.keymap.set('n', '<leader>sv', '<C-w>v') -- ウィンドウを垂直方向に分割する
vim.keymap.set('n', '<leader>sh', '<C-w>s') -- ウィンドウを水平に分割する
vim.keymap.set('n', '<leader>se', '<C-w>=') -- ウィンドウの幅を等分にする
vim.keymap.set('n', '<leader>sx', ':close<CR>') -- 現在、カーソルがいるウィンドウを閉じる
vim.keymap.set('n', '<leader>sw', '<C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>>') -- ウィンドウの幅を少し広げる
vim.keymap.set('n', '<leader>sww', '<C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>>') -- ウィンドウの幅を大きく広げる
vim.keymap.set('n', '<leader>st', '<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><') -- ウィンドウの幅を少し狭める
vim.keymap.set('n', '<leader>stt', '<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><') -- ウィンドウの幅を大きく狭める

-- タブを作成、削除
vim.keymap.set('n', '<leader>to', ':tabnew<CR>')
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>')
vim.keymap.set('n', '<leader>tn', ':tabn<CR>')
vim.keymap.set('n', '<leader>tp', ':tabp<CR>')

-- ウィンドウを移動する
vim.keymap.set('n', '<leader>ll', '<C-w>l')
vim.keymap.set('n', '<leader>hh', '<C-w>h')
vim.keymap.set('n', '<leader>jj', '<C-w>j')
vim.keymap.set('n', '<leader>kk', '<C-w>k')

-- 単語を' " どちらかで囲う
vim.keymap.set('n', '<leader>aw', 'ciw""<Esc>P')
vim.keymap.set('n', '<leader>aW', "ciw''<Esc>P")
