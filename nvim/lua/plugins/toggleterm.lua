return {
  "akinsho/toggleterm.nvim",                     -- ターミナルプラグイン
  version = "*",                                 -- 最新の安定版を使用
  event = "VeryLazy",                           -- 遅延ロード設定
  opts = {
    size = 30,                                   -- ターミナルウィンドウのサイズ
    direction = 'horizontal',                    -- ターミナルの開き方（horizontal=横分割）
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)            -- 設定を適用
    
    -- Terminalクラスをインポート
    local Terminal = require("toggleterm.terminal").Terminal
    
    -- LazyGit用のターミナルインスタンスを作成
    local lazygit = Terminal:new({
      cmd = "lazygit",                          -- 実行するコマンド
      direction = "float",                      -- フローティングウィンドウで表示
      hidden = true                             -- 非表示時にバッファを維持
    })
    
    -- LazyGitトグル関数を定義
    _G.lazygit_toggle = function()
      lazygit:toggle()                          -- LazyGitの表示/非表示を切り替え
    end
  end,
  keys = {
    { "<leader>tg", "<cmd>lua lazygit_toggle()<cr>", desc = "LazyGit" },  -- LazyGit起動キーマップ
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Terminal (Horizontal)" },
    { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Terminal (Vertical)" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal (Float)" },
  },
}
