local M = {}

vim.api.nvim_create_augroup("CapsWord", { clear = true })

---@param bufnr number
---@param config Config
local function turn_off(bufnr, config)
  vim.api.nvim_clear_autocmds({ group = "CapsWord", buffer = bufnr })
  vim.b[bufnr].caps_word_active = false

  if config and config.exit_callback then
    config.exit_callback()
  end
end

---@param config Config
M.toggle_caps_word = function(config)
  local bufnr = vim.api.nvim_get_current_buf()
  if vim.b[bufnr].caps_word_active then
    turn_off(bufnr, config)
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
          turn_off(bufnr, config)
        end
      end,
    })

    -- Add an autocommand to clear the group on InsertLeave
    vim.api.nvim_create_autocmd("InsertLeave", {
      group = "CapsWord",
      buffer = bufnr,
      callback = function()
        turn_off(bufnr, config)
      end,
    })

    vim.b[bufnr].caps_word_active = true
    if config and config.enter_callback then
      config.enter_callback()
    end
  end
end

return M
