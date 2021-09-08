local M = {}

local function find_files_for_path(path)
  opts = {
    prompt_title = '~ ' .. path .. ' ~',
    shorten_path = false,
    cwd = path,
    layout_strategy = "flex",
    layout_config = {
      width = 0.9,
      height = 0.8,

      horizontal = {
        width = { padding = 0.15 },
      },
      vertical = {
        preview_height = 0.75,
      },
    },
  }

  require("telescope.builtin").find_files(opts)
end

function M.edit_config()
  local path = '~/.config/nvim'
  find_files_for_path(path)
end

return M
