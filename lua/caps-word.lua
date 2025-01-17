local plugin = require("caps-word.module")

---@class Config
---@field auto_underscore_inject boolean Automatically changes - to _ when caps word is activated
---@field enable_numbers_in_caps boolean Does not turn the caps mode off on number input
---@field match_word_string string | nil  The regex string to match the word
---@field enter_callback fun() | nil Callback function to run when caps word is activated
---@field exit_callback fun() | nil Callback function to run when caps word is deactivated
local config = {
  auto_underscore_inject = true,
  enable_numbers_in_caps = true,
  match_word_string = nil,
  enter_callback = nil,
  exit_callback = nil,
}

---@class CapsWordPlugin
local M = {}

---@type Config
M.config = config

---@param args Config?
M.setup = function(args)
  M.config = vim.tbl_deep_extend("force", M.config, args or {})

  if not M.config.match_word_string then
    -- ther \\k uses is_keyword option which is ideal for validating if this is a word
    M.config.match_word_string = config.enable_numbers_in_caps and "\\K" or "\\k"
  end
end

M.toggle = function()
  plugin.toggle_caps_word(M.config)
end

return M
