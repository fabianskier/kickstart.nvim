-- Markdown Preview
vim.keymap.set('n', '<leader>mp', ':MarkdownPreview<CR>', { desc = 'Start Markdown Preview' })
vim.keymap.set('n', '<leader>ms', ':MarkdownPreviewStop<CR>', { desc = 'Stop Markdown Preview' })
vim.keymap.set('n', '<leader>mt', ':MarkdownPreviewToggle<CR>', { desc = 'Toggle Markdown Preview' })

-- Copy content and path
vim.api.nvim_set_keymap('n', '<leader>ya', 'ggVG"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cp', ':let @+=expand("%:p")<CR>', { noremap = true, silent = true })

-- Tmux Navigation
vim.keymap.set('n', '<C-h>', '<cmd>TmuxNavigateLeft<CR>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<cmd>TmuxNavigateRight<CR>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<cmd>TmuxNavigateDown<CR>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<cmd>TmuxNavigateUp<CR>', { desc = 'Move focus to the upper window' })

-- Finder and diagnostics
vim.api.nvim_set_keymap('n', '<leader>of', ':lua Open_in_finder()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show floating diagnostics' })

-- Function to open Finder from Neovim
function Open_in_finder()
  local file_path = vim.fn.expand '%:p:h'
  vim.fn.system { 'open', file_path }
end
