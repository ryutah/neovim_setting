local aerial = require('aerial')

aerial.setup({
  layout = {
    min_width = 40,
  }
})

vim.keymap.set('n', '<Leader>o', '<cmd>AerialToggle<CR>', { silent = true })
