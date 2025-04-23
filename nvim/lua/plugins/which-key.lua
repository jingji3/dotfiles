return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      marks = true,
      registers = true,
      spelling = { enabled = false },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    -- 'window' から 'win' に変更
    win = {
      border = "rounded",
      padding = { 2, 2, 2, 2 },
    },
    -- トリガー設定
    triggers = {
      { "<auto>", mode = "nixsotc" }, -- 自動トリガー
    },
    -- アイコン設定
    icons = {
      breadcrumb = "»", -- 階層区切り
      separator = "➜", -- キーとディスクリプションの区切り
      group = "+", -- グループを表すマーク
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    
    -- 新しい形式でキーマップを登録
    wk.add({
      -- グループの定義
      { "<leader>f", group = "ファイル/検索" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "LSP" },
      
      -- f グループに属するマッピング例（必要に応じて追加）
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "ファイル検索" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "テキスト検索" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
      
      -- 非表示にしたいキーマップ（警告で出ていた）
      { "<leader>f_", hidden = true },
      { "<leader>g_", hidden = true },
      { "<leader>l_", hidden = true },
    })
  end,
  keys = {
    { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps" },
  },
}
