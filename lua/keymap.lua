vim.g.mapleader = " "

-- cursor
vim.keymap.set({ 'n', 'x', 'o' }, 'j', 'gj')
vim.keymap.set({ 'n', 'x', 'o' }, 'k', 'gk')
vim.keymap.set({ 'n', 'x', 'o' }, 'gj', 'j')
vim.keymap.set({ 'n', 'x', 'o' }, 'gk', 'k')
vim.keymap.set({ 'n', 'x', 'o' }, 'H', '^')
vim.keymap.set({ 'n', 'x', 'o' }, 'L', '$')
vim.keymap.set({ 'n', 'x' }, 'F', '%')

-- buffer moving
vim.keymap.set('n', '[buffer]', '<Nop>')
vim.keymap.set('n', '<Leader>b', '[buffer]', { remap = true })
vim.keymap.set('n', '[buffer]n', '<CMD>bnext<CR>', { silent = true })
vim.keymap.set('n', '[buffer]p', '<CMD>bprevious<CR>', { silent = true })

-- split screent
vim.keymap.set('n', '[split]', '<Nop>')
vim.keymap.set('n', '<Leader>s', '[split]', { remap = true })
vim.keymap.set('n', '[split]v', '<CMD>vsplit<CR>', { silent = true })
vim.keymap.set('n', '[split]s', '<CMD>split<CR>', { silent = true })
vim.keymap.set('n', '[split]l', '<C-w>l', { silent = true })
vim.keymap.set('n', '[split]h', '<C-w>h', { silent = true })
vim.keymap.set('n', '[split]j', '<C-w>j', { silent = true })
vim.keymap.set('n', '[split]k', '<C-w>k', { silent = true })
vim.keymap.set('n', '[split]w', '<C-w>p', { silent = true })
vim.keymap.set('n', '[split]o', '<C-w>=', { silent = true })
vim.keymap.set('n', '[split]>', '20<C-w>>', { silent = true })
vim.keymap.set('n', '[split]<', '20<C-w><', { silent = true })
vim.keymap.set('n', '[split]+', '10<C-w>+', { silent = true })
vim.keymap.set('n', '[split]-', '10<C-w>-', { silent = true })

-- terminal keymap
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<C-[>', '<C-\\><C-n>')
