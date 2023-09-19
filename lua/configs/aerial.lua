local aerial = require('aerial')

aerial.setup({
  layout = {
    min_width = 40,
  },
  keymaps = {
    ['o'] = 'actions.jump',
  }
})

vim.keymap.set('n', '<Leader>o', '<cmd>AerialToggle<CR>', { silent = true })
