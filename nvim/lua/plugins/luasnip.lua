return {
  "L3MON4D3/LuaSnip",                          -- スニペットエンジン
  version = "v2.*",                            -- 最新の安定版を使用
  build = "make install_jsregexp",             -- 正規表現サポートのインストール
  dependencies = {
    "rafamadriz/friendly-snippets",            -- 多くの言語用の既製スニペット集
  },
  config = function()
    local ls = require("luasnip")
    
    -- スニペットの読み込み
    require("luasnip.loaders.from_vscode").lazy_load()  -- VSCode形式のスニペットを読み込み
    
    -- キーマッピング
    vim.keymap.set({"i", "s"}, "<Tab>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()                    -- スニペット展開または次のプレースホルダーへ
      else
        return "<Tab>"                         -- 通常のタブ入力
      end
    end, { silent = true })
    
    vim.keymap.set({"i", "s"}, "<S-Tab>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)                            -- 前のプレースホルダーへ
      else
        return "<S-Tab>"
      end
    end, { silent = true })
  end,
}
