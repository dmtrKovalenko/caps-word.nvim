local M = {}

vim.api.nvim_create_augroup("CapsWord", { clear = true })

local function turn_off(bufnr)
  vim.api.nvim_clear_autocmds({ group = "CapsWord", buffer = bufnr })
  vim.b[bufnr].caps_word_active = false
end

---@param config Config
M.toggle_caps_word = function(config)
  local bufnr = vim.api.nvim_get_current_buf()
  if vim.b[bufnr].caps_word_active then
    turn_off(bufnr)
  else
    vim.api.nvim_create_autocmd("InsertCharPre", {
      group = "CapsWord",
      buffer = bufnr,
      callback = function()
        local char = vim.v.char

        if config.auto_underscore_inject and char == "-" then
          vim.v.char = "_"
          return
        end

        if vim.fn.match(char, config.match_word_string or "\\K") == 0 then
          vim.v.char = vim.fn.toupper(char)
        else
          turn_off(bufnr)
        end
      end,
    })

    -- Add an autocommand to clear the group on InsertLeave
    vim.api.nvim_create_autocmd("InsertLeave", {
      group = "CapsWord",
      buffer = bufnr,
      callback = function()
        turn_off(bufnr)
      end,
    })

    vim.b[bufnr].caps_word_active = true
  end
end

return M
