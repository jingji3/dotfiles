return {
  -- ERBとHTMLの自動タグ閉じ
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require('nvim-ts-autotag').setup({
        filetypes = {
          'html', 'xml', 'erb', 'eruby',
          'javascriptreact', 'typescriptreact'
        },
        -- ERB専用の設定
        aliases = {
          ["eruby"] = "html"
        }
      })
    end,
  },

  -- Emmet機能
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "eruby", "erb", "javascriptreact", "typescriptreact" },
    config = function()
      -- Ctrl+Eでの展開に変更（より直感的なキー）
      vim.g.user_emmet_expandabbr_key = '<C-e>'

      -- ERBファイルタイプの設定
      vim.g.user_emmet_settings = {
        eruby = {
          extends = 'html',
        },
        html = {
          filters = 'html',
        },
      }

      -- グローバルインストールを無効化し、特定のファイルタイプでのみ有効化
      vim.g.user_emmet_install_global = 0
      vim.cmd([[
        autocmd FileType html,css,eruby,erb,javascriptreact,typescriptreact EmmetInstall
      ]])
    end,
  },

  -- Ruby/Rails専用の補完プラグイン
  {
    "tpope/vim-rails",
    ft = { "ruby", "eruby" },
    config = function()
      -- Railsプロジェクト用の設定
      vim.g.rails_projections = {
        ["app/controllers/*_controller.rb"] = {
          test = "spec/controllers/{}_controller_spec.rb",
          alternate = "spec/controllers/{}_controller_spec.rb",
        },
        ["app/models/*.rb"] = {
          test = "spec/models/{}_spec.rb",
          alternate = "spec/models/{}_spec.rb",
        },
      }
    end,
  },

  -- Ruby用LSPの強化設定
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason-lspconfig").setup_handlers({
        ["solargraph"] = function()
          require("lspconfig").solargraph.setup({
            settings = {
              solargraph = {
                diagnostics = true,
                completion = true,
                autoformat = true,
                formatting = true,
                references = true,
                rename = true,
                symbols = true,
              },
            },
          })
        end,
      })
    end,
  },
}
