return {
  { 'christoomey/vim-tmux-navigator' },
  { 'numToStr/Comment.nvim', opts = {} },
  {
    'stevearc/oil.nvim',
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        view_options = {
          show_hidden = true,
        },
        skip_confirm_for_simple_edits = false,
      }
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end,
  },
  {
    'AckslD/nvim-neoclip.lua',
    dependencies = {
      { 'nvim-telescope/telescope.nvim' },
      { 'kkharji/sqlite.lua', module = 'sqlite' },
    },
    config = function()
      require('neoclip').setup {
        history = 1000,
        enable_persistent_history = true,
        continuous_sync = true,
        default_register = { '"', '+' },
        preview = true,
      }
      require('telescope').load_extension 'neoclip'
      vim.keymap.set('n', '<leader>sy', ':Telescope neoclip<CR>', { desc = 'Open Neoclip history with Telescope' })
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    ft = { 'markdown' },
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    'tpope/vim-dadbod',
    dependencies = {
      'kristijanhusak/vim-dadbod-ui',
      'kristijanhusak/vim-dadbod-completion',
    },
    config = function()
      vim.keymap.set('n', '<leader>db', ':DBUI<CR>', { desc = 'Open DBUI' })
    end,
  },
}

