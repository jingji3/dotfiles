return {
  "windwp/nvim-ts-autotag",                -- プラグインのリポジトリ名
  event = { "BufReadPre", "BufNewFile" },  -- プラグインをロードするタイミング（ファイル読み込み前・新規作成時）
  dependencies = {                         -- 必要な依存プラグイン
    "nvim-treesitter/nvim-treesitter",    -- treesitterが必須（タグ構造の解析に使用）
  },
  config = function()                      -- プラグインの設定関数
    require('nvim-ts-autotag').setup({
      opts = {                             -- 基本オプション
        enable_close = true,               -- <div>と入力すると自動で</div>が追加される
        enable_rename = true,              -- 開始タグを編集すると終了タグも自動で変更される
        enable_close_on_slash = false      -- </を入力した時の自動補完（falseで無効）
      },
      per_filetype = {                     -- ファイルタイプごとのカスタム設定
        ["html"] = {                       -- HTMLファイルでの設定
          enable_close = false             -- HTMLでは自動閉じタグ機能を無効化
        }
      },
      -- カスタムエイリアスの設定（必要に応じて）
      aliases = {                          -- 非対応言語を既存の設定にマッピング
        -- ["custom_language"] = "html",   -- 例：カスタム言語をHTMLの設定で動作させる
      }
    })
  end,
}
