return { 
  {
    "folke/tokyonight.nvim",      -- GitHubリポジトリのパス（folke/tokyonight.nvimを参照）
    name = "tokyonight",          -- プラグインの名前を指定
    priority = 1000,              -- 優先度を高く設定（1000）して他のプラグインより先に読み込む
                                  -- カラースキームは早く読み込まれる必要があるため
    lazy = false,                 -- lazy.nvimの遅延読み込み機能を無効化
                                  -- 起動時に即座に読み込むように設定（カラースキームは即時適用したい）
    opts = {
      -- カラースキームのカスタム設定
      style = "night",            -- カラーテーマのスタイルを「storm」に設定
                                  -- 選択肢: storm（暗め・青っぽい）, night（最も暗い）, moon（少し明るめ）, day（明るい）
      light_style = "day",        -- ライトモード時は「day」スタイル
      transparent = true,         -- 背景を透過する設定を有効化
                                  -- ターミナルの背景色が透けて見える
      terminal_colors = true,     -- ターミナルの色もテーマに合わせて設定
      
      styles = {                  -- 各シンタックス要素のスタイル設定
        comments = { italic = true }, -- コメントをイタリック体に
        keywords = { italic = true }, -- キーワードもイタリック体に
        -- 以下は特別なスタイルを適用しない要素
        functions = {},           -- 関数
        variables = {},           -- 変数
        sidebars = "dark",        -- サイドバーのスタイル
        floats = "dark",          -- フロートウィンドウのスタイル
      },
      
      sidebars = { "qf", "help" }, -- サイドバーとして扱うバッファタイプ
      
      dim_inactive = false,       -- 非アクティブウィンドウを暗くする機能を無効化
      
      -- 他のプラグインとの連携設定が自動的に行われますが、
      -- 明示的に設定することも可能です
      on_highlights = function(hl, c)
        -- カスタムハイライトの設定（必要に応じて）
        -- 例: hl.Normal = { bg = "none" }
      end,
    },
    
    config = function(_, opts)    -- プラグイン設定を適用する関数
      require("tokyonight").setup(opts) -- カスタム設定を適用
      vim.cmd.colorscheme "tokyonight" -- カラースキームを有効化
    end,
  },
}
