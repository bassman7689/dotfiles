local helpers = require('srodman.helpers')
local opt = vim.opt
opt.showbreak = "↪ "
opt.listchars = {
  tab="→ ",
  eol="↲",
  nbsp="␣",
  trail="•",
  extends="⟩",
  precedes="⟨",
} 

M = {}

local function matching_unequal_length_strings(str1, str2)
  local min_len = math.min(#str1, #str2)
  return string.sub(str1, 1, min_len)  == string.sub(str2, 1, min_len)
end

local DEFAULT_SPLIT_DIRECTION = 'vertical'

options = {
  vertical='vsplit',
  horizontal='split',
}

M.scratch = function(split_direction)
  if split_direction == "" then
    split_direction = DEFAULT_SPLIT_DIRECTION
  end

  local found_match = false
  for dir, cmd in pairs(options) do
    if matching_unequal_length_strings(split_direction, dir) then
      found_match = true
      vim.cmd(cmd)
    end
  end

  if not found_match then
    error('split_direction \'' .. split_direction .. '\' is not supported. supported directions are: \'vertical\' or \'horizontal\'')
  end

  local winnr = vim.api.nvim_get_current_win()
  local bufnr = helpers.create_unlisted_scratch_buffer()
  vim.api.nvim_buf_set_option(bufnr, 'swapfile', false)
  vim.api.nvim_win_set_buf(winnr, bufnr)
end

return M
