local M = {}

M.exec = function(command)
  local output = vim.fn.system(command)
  vim.api.nvim_command('normal! a' .. output .. '<esc>')
end

M.delete_hidden_scratch_buffers = function()
  local buffers = vim.fn.getbufinfo({bufloaded=1})
  for _, buf in ipairs(buffers) do
    if vim.api.nvim_buf_get_option(buf.bufnr, 'buftype') == 'nofile' and buf.hidden == 1 then
      vim.api.nvim_buf_delete(buf.bufnr, {force=true})
    end
  end
end

local function close_window_and_delete_buffer(winnr)
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  vim.api.nvim_win_close(winnr, true)
  if vim.api.nvim_buf_is_valid(bufnr) then
    vim.api.nvim_buf_delete(bufnr, {force=true})
  end
end

M.close_floating_windows = function()
  local windows = vim.fn.getwininfo()
  for _, win in ipairs(windows) do
    if vim.api.nvim_win_get_config(win.winid).relative ~= "" then
      close_window_and_delete_buffer(win.winid)
    end
  end
end

M.close_window_and_delete_buffer = close_window_and_delete_buffer

M.scriptnames = function(filter)
  local save_more = vim.opt.more
  vim.opt.more = false
  local lines = vim.fn.execute('scriptnames')
  vim.opt.more = save_more
  local output_lines = {}
  for _, line in ipairs(vim.fn.split(lines, '\n')) do
    if line ~= "" then
      line = line:gsub('%s*%d+:%s*(.*)%s*', '%1')

      if filter ~= "" and filter ~= nil then
        if vim.fn.match(line, filter) ~= -1 then
          table.insert(output_lines, line)
        end
      else
        table.insert(output_lines, line)
      end
    end
  end

  if #output_lines == 0 then
    output_lines = {"No matching script names."}
  end

  local bufnr = vim.api.nvim_create_buf(false, true)
  local winnr = vim.api.nvim_open_win(bufnr, true, {
    relative="editor",
    width=math.floor((vim.o.columns / 2) + 0.5),
    height=math.floor((vim.o.lines / 2) + 0.5),
    col=math.floor((vim.o.columns/4) + 0.5),
    row=math.floor((vim.o.lines/4) + 0.5),
  })

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, output_lines)

  vim.cmd [[ augroup Scriptnames ]]
  vim.cmd [[ autocmd! ]]
  vim.cmd(string.format(
      "autocmd BufLeave <buffer=%s> lua require('srodman.helpers').close_window_and_delete_buffer(%s)",
      bufnr,
      winnr
  ))
  vim.cmd [[ augroup END ]]

  vim.api.nvim_buf_set_keymap(
    bufnr,
    'n',
    '<ESC>',
    string.format(
      ":lua require('srodman.helpers').close_window_and_delete_buffer(%s)<CR>",
      winnr
    ),
    {
      noremap = true,
      silent = true,
    }
  )
end

return M
