-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Set basic Vim options
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.hlsearch = true -- Highlight search results
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.shiftwidth = 2 -- Number of spaces to use for each indentation
vim.opt.tabstop = 2 -- Number of spaces tabs count for

vim.keymap.set('n', '<leader>mp', ':MarkdownPreview<CR>', { desc = 'Start Markdown Preview' })
vim.keymap.set('n', '<leader>ms', ':MarkdownPreviewStop<CR>', { desc = 'Stop Markdown Preview' })
vim.keymap.set('n', '<leader>mt', ':MarkdownPreviewToggle<CR>', { desc = 'Toggle Markdown Preview' })

return {
  -- File browser in the buffer with Oil.nvim
  -- This allows for navigating directories within the buffer, like a file explorer
  {
    'stevearc/oil.nvim',
    dependencies = { { 'echasnovski/mini.icons', opts = {} } }, -- Optional icon support
    config = function()
      require('oil').setup {
        columns = { 'icon' }, -- Show file icons
        view_options = {
          show_hidden = true, -- Show hidden files
        },
        skip_confirm_for_simple_edits = false, -- Confirm edits
      }

      -- Keymap to open Oil and navigate to the parent directory
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end,
  },

  -- Theme plugin: Catppuccin
  -- Aesthetic theme setup with priority to load early
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- Load theme before other plugins
    config = function()
      require('catppuccin').setup()

      -- Set the color scheme to 'catppuccin-mocha'
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },

  -- Tmux navigator integration
  -- Allows seamless navigation between Neovim and Tmux splits
  { 'christoomey/vim-tmux-navigator' },

  -- Comment plugin: Easy commenting
  -- Use `gcc` to comment/uncomment lines or selections
  { 'numToStr/Comment.nvim', opts = {} },

  -- Neoclip clipboard manager with Telescope integration
  -- Provides clipboard history with persistent storage
  {
    'AckslD/nvim-neoclip.lua',
    dependencies = {
      { 'nvim-telescope/telescope.nvim' }, -- Required for search functionality
      { 'kkharji/sqlite.lua', module = 'sqlite' }, -- Optional for persistent history
    },
    config = function()
      require('neoclip').setup {
        history = 1000, -- Store up to 1000 entries in history
        enable_persistent_history = true, -- Persist history between sessions
        continuous_sync = true, -- Sync history continuously with SQLite
        default_register = { '"', '+' }, -- Use the unnamed and system registers
        preview = true, -- Show a preview of yanked items
      }

      -- Load the Neoclip extension for Telescope
      require('telescope').load_extension 'neoclip'

      -- Keymap to open Neoclip history with Telescope
      vim.keymap.set('n', '<leader>sy', ':Telescope neoclip<CR>', { desc = 'Open Neoclip history with Telescope' })
    end,
  },

  -- Preview markdown files in your browser directly from Neovim.
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install', -- Install dependencies
    ft = { 'markdown' }, -- Load the plugin only for markdown files
    config = function()
      vim.g.mkdp_auto_start = 1 -- Automatically start preview when opening markdown files
    end,
  },

  {
    'tpope/vim-dadbod',
    dependencies = {
      'kristijanhusak/vim-dadbod-ui', -- Optional: GUI-like interface
      'kristijanhusak/vim-dadbod-completion', -- Optional: Autocompletion for SQL queries
    },
    config = function()
      -- Optional settings and custom keymaps
      vim.keymap.set('n', '<leader>db', ':DBUI<CR>', { desc = 'Open DBUI' })
    end,
  },
}
