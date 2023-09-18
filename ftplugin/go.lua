local toggle_test = function()
  local file_name = vim.fn.expand('%:t:r')
  local dir_name = vim.fn.expand('%:p:h')

  -- check file_name end with '_test.go'
  if string.sub(file_name, -5) == '_test' then
    -- remove '_test.go'
    local target_file_name = string.sub(file_name, 1, -6) .. '.go'
    local target_path = dir_name .. '/' .. target_file_name
    -- check target file exists
    if vim.fn.filereadable(target_path) == 1 then
      -- open target file
      vim.cmd("e " .. target_path)
    end
  else
    -- add '_test.go'
    local target_file_name = file_name .. '_test.go'
    local target_path = dir_name .. '/' .. target_file_name
    -- check target file exists
    if vim.fn.filereadable(target_path) == 1 then
      -- open target file
      vim.cmd("e " .. target_path)
    end
  end
end

vim.api.nvim_create_user_command('GoToggleTest', toggle_test, {})
