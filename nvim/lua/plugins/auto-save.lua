-- lua/plugins/autosave.lua
return {
  "okuuva/auto-save.nvim",
  event = { "InsertLeave", "TextChanged" },
  opts = {
    enabled = true,
    -- execution_message の設定を削除
    trigger_events = {
      immediate_save = { "BufLeave", "FocusLost" },
      defer_save = { "InsertLeave", "TextChanged" },
      cancel_deferred_save = { "InsertEnter" },
    },
    write_all_buffers = false,
    debounce_delay = 1000,
    condition = function(buf)
      local fn = vim.fn
      local utils = require("auto-save.utils.data")
      if fn.getbufvar(buf, "&modifiable") == 1 and
          utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
        return true
      end
      return false
    end,
  },
  -- メッセージを自分で実装する場合
  config = function(_, opts)
    require("auto-save").setup(opts)
    
    -- カスタムメッセージの実装（必要な場合）
    vim.api.nvim_create_autocmd("User", {
      pattern = "AutoSaveWritePost",
      callback = function()
        vim.notify("AutoSaved at " .. vim.fn.strftime("%H:%M:%S"), vim.log.levels.INFO)
      end,
    })
  end,
}
