-- plugins/colorscheme.lua
return {
  {
    "joshdick/onedark.vim",     -- TomorrowNightに近い落ち着いたテーマ
    name = "onedark",
    priority = 1000,
    lazy = false,
    config = function()
      -- 背景の透過設定
      vim.g.onedark_terminal_italics = 1
      vim.g.onedark_hide_endofbuffer = 1
      vim.g.onedark_termcolors = 256
      
      -- 透過背景の設定
      vim.cmd([[
        augroup TransparentBG
          autocmd!
          autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
          autocmd ColorScheme * highlight LineNr guibg=NONE ctermbg=NONE
          autocmd ColorScheme * highlight SignColumn guibg=NONE ctermbg=NONE
          autocmd ColorScheme * highlight EndOfBuffer guibg=NONE ctermbg=NONE
        augroup END
      ]])
      
      -- コメントとキーワードをイタリックに
      vim.cmd([[
        augroup CustomHighlights
          autocmd!
          autocmd ColorScheme * highlight Comment gui=italic
          autocmd ColorScheme * highlight Keyword gui=italic
        augroup END
      ]])
      
      -- カラースキームを適用
      vim.cmd.colorscheme "onedark"
    end,
  },
}
