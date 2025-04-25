return {
  "windwp/nvim-autopairs",                     -- 自動ペア挿入プラグイン
  event = "InsertEnter",                       -- インサートモードに入った時にロード
  dependencies = {
    "hrsh7th/nvim-cmp",                       -- cmpとの連携用（オプション）
  },
  opts = {
    check_ts = true,                           -- treesitterを使用してペアを確認
    ts_config = {
      lua = { "string" },                      -- Luaの文字列内ではペアを無効
      javascript = { "template_string" },      -- JSのテンプレート文字列内ではペアを無効
      java = false,                            -- Javaでtreesitterチェックを無効
    },
    disable_filetype = {                       -- 自動ペアを無効にするファイルタイプ
      "TelescopePrompt",                      -- Telescopeのプロンプト
      "vim",                                  -- Vimスクリプト
      "spectre_panel",                        -- Spectreパネル
    },
    fast_wrap = {                              -- 高速ラップ機能の設定
      map = "<M-e>",                          -- Alt+eでトリガー
      chars = { "{", "[", "(", '"', "'" },    -- ラップ対象文字
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0,                             -- カーソルオフセット
      end_key = "$",                          -- 終了キー
      keys = "qwertyuiopzxcvbnmasdfghjkl",    -- ジャンプ用キー
      check_comma = true,                     -- カンマの後にスペースを追加
      highlight = "PmenuSel",                 -- ハイライトグループ
      highlight_grey = "LineNr",              -- グレーアウト用ハイライト
    },
    enable_check_bracket_line = false,         -- 括弧の行チェックを無効化
    ignored_next_char = "[%w%.]",             -- 次の文字が英数字やドットなら無視
  },
  config = function(_, opts)
    local npairs = require("nvim-autopairs")
    npairs.setup(opts)
    
    -- nvim-cmpとの連携設定
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp_status_ok, cmp = pcall(require, "cmp")
    if cmp_status_ok then
      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done()        -- cmpで補完確定時に自動ペアを挿入
      )
    end
    
    -- カスタムルールの追加（オプション）
    local Rule = require("nvim-autopairs.rule")
    local cond = require("nvim-autopairs.conds")
    
    -- 一般的なルール
    npairs.add_rules({
      Rule("$", "$", { "tex", "latex" })      -- TeXでの数式入力用
        :with_move(cond.none())
        :with_cr(cond.none()),
    })
    
    -- 特定の言語用のルール
    npairs.add_rules({
      Rule("<", ">", { "html", "xml", "typescriptreact", "javascriptreact" })
        :with_pair(cond.not_before_regex("[%w%s]", 1))
        :with_move(cond.none()),
    })
  end,
}
