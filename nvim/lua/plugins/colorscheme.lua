-- plugins/colorscheme.lua
return {
  {
    "catppuccin/nvim",         -- GitHubリポジトリのパス（catppuccin/nvimリポジトリを参照）
    name = "catppuccin",       -- プラグインの名前を指定
    priority = 1000,           -- 優先度を高く設定（1000）して他のプラグインより先に読み込む
                               -- カラースキームは早く読み込まれる必要があるため
    lazy = false,              -- lazy.nvimの遅延読み込み機能を無効化
                               -- 起動時に即座に読み込むように設定（カラースキームは即時適用したい）
    opts = {
      -- カラースキームのカスタム設定
      flavour = "macchiato",    -- カラーテーマのフレーバーを「macchiato」に設定
                                -- 選択肢: latte（明るめ）, frappe, macchiato, mocha（暗め）
      background = {            -- システムのダークモード/ライトモードに応じた設定
        light = "latte",        -- ライトモード時は「latte」フレーバー
        dark = "macchiato",     -- ダークモード時は「macchiato」フレーバー
      },
      transparent_background = true, -- 背景を透過する設定を有効化
                                     -- ターミナルの背景色が透けて見える
      term_colors = true,            -- ターミナルの色もテーマに合わせて設定
      
      dim_inactive = {              -- 非アクティブウィンドウの暗転設定
        enabled = false,            -- 非アクティブウィンドウを暗くする機能を無効化
        shade = "dark",             -- 暗くする方向（使用しない設定）
        percentage = 0.15,          -- 暗くする度合い（使用しない設定）
      },
      
      styles = {                    -- 各シンタックス要素のスタイル設定
        comments = { "italic" },    -- コメントをイタリック体に
        conditionals = { "italic" }, -- 条件文（if/elseなど）もイタリック体に
        -- 以下は特別なスタイルを適用しない要素
        loops = {},                 -- ループ構文
        functions = {},             -- 関数
        keywords = {},              -- キーワード
        strings = {},               -- 文字列
        variables = {},             -- 変数
        numbers = {},               -- 数値
        booleans = {},              -- 真偽値
        properties = {},            -- プロパティ
        types = {},                 -- 型
        operators = {},             -- 演算子
      },
      
      color_overrides = {},         -- カラーパレットの上書き設定（未設定）
      custom_highlights = {},       -- カスタムハイライトグループ（未設定）
      
      integrations = {              -- 他のプラグインとの連携設定
        cmp = true,                 -- nvim-cmp（補完プラグイン）との連携
        gitsigns = true,            -- gitsigns（Gitの差分表示）との連携
        nvimtree = true,            -- nvim-tree（ファイルエクスプローラ）との連携
        telescope = true,           -- telescope（ファインダー）との連携
        treesitter = true,          -- treesitter（構文解析）との連携
        notify = true,              -- nvim-notify（通知）との連携
        which_key = true,           -- which-key（キーバインド表示）との連携
      },
    },
    
    config = function(_, opts)      -- プラグイン設定を適用する関数
      require("catppuccin").setup(opts) -- カスタム設定を適用
      vim.cmd.colorscheme "catppuccin"  -- カラースキームを有効化
    end,
  },
}
