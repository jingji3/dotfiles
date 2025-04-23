return {
 "nvim-tree/nvim-tree.lua",                     -- ファイルエクスプローラーのプラグイン
 event = "VeryLazy",                            -- 遅延ロード設定
 keys = {
   { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "TreeToggle" },  -- ファイルツリーの表示/非表示切り替え
 },
 config = function()
   local function my_on_attach(bufnr)
     local api = require("nvim-tree.api")       -- nvim-treeのAPI読み込み
     local map = vim.keymap.set                 -- マッピング関数のショートカット
     local opts = function(desc)
       return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = false, silent = true, nowait = true }
     end                                         -- マッピングオプション作成関数
     api.config.mappings.default_on_attach(bufnr)  -- デフォルトキーマッピングを適用
     map("n", "<CR>", api.node.open.no_window_picker, opts "Open: No Window Picker")  -- ウィンドウピッカーなしで開く
     map("n", "O", api.node.open.edit, opts "Open")  -- 編集モードで開く
     map("n", "X", api.fs.cut, opts "Cut")      -- ファイルカット
     map("n", "x", api.node.navigate.parent_close, opts "Parent Close")  -- 親ノードを閉じる
     vim.keymap.del("n", "<C-e>", { buffer = bufnr })  -- Ctrl+eマッピングを削除
   end
   require("nvim-tree").setup({
     update_focused_file = {
       enable = true,                           -- 編集中ファイルをハイライト
     },
     git = {
       enable = true,                           -- Gitステータス表示を有効化
     },
     modified = {
       enable = true,                           -- 変更ファイル表示を有効化
     },
     on_attach = my_on_attach,                  -- カスタムキーマッピングを適用
     -- アイコン表示に関する設定を追加
     renderer = {
       icons = {
         show = {
           file = true,
           folder = true,
           folder_arrow = true,
           git = true,
         },
       },
       indent_markers = {
         enable = true, -- インデントマーカーを表示
       },
     },
     -- 隠しファイルの表示設定
     filters = {
       dotfiles = false, -- 隠しファイルも表示する場合はfalse
     },
   })
 end
}
