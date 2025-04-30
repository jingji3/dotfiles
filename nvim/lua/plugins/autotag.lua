return {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    require('nvim-ts-autotag').setup({
      opts = {
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = true -- Auto close on trailing </
      },
      filetypes = { 
        'html', 'xml', 'erb', 'eruby',
        'embedded_template', -- これも追加
        'javascript', 'javascriptreact', 
        'typescript', 'typescriptreact' 
      },
    })
  end,
}
