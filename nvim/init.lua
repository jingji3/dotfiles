require("lazy_setup")    -- Lazy.nvim設定を読み込み
require('keymaps')    -- キーマッピング設定を読み込む
-- 基本的な表示設定
vim.opt.number = true           -- 行番号を表示
vim.opt.relativenumber = false   -- 相対行番号を表示
vim.opt.cursorline = true       -- カーソル行をハイライト
vim.opt.termguicolors = true    -- 24ビットカラーを使用

-- インデントとタブの設定
vim.opt.expandtab = true        -- タブをスペースに変換
vim.opt.tabstop = 2             -- タブ幅を2スペースに設定
vim.opt.shiftwidth = 2          -- インデント幅を2スペースに設定
vim.opt.smartindent = true      -- スマートインデントを有効化

-- 検索設定
vim.opt.ignorecase = true       -- 検索時に大文字小文字を区別しない
vim.opt.smartcase = true        -- 検索パターンに大文字が含まれる場合は区別する
vim.opt.hlsearch = true         -- 検索結果をハイライト

-- ファイル関連の設定
vim.opt.backup = false          -- バックアップファイルを作成しない
vim.opt.swapfile = false        -- スワップファイルを作成しない
vim.opt.undofile = true         -- 永続的なundoの履歴を有効化
