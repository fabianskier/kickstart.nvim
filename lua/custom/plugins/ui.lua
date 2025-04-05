return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup()
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
      'hrsh7th/nvim-cmp',
    },
    config = function()
      require('noice').setup {
        lsp = {
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = false,
        },
        views = {
          cmdline_popup = {
            position = {
              row = '50%', -- vertical center
              col = '50%', -- horizontal center
            },
            size = {
              width = 60,
              height = 'auto',
            },
            border = {
              style = 'rounded',
            },
          },
        },
        cmdline = {
          view = 'cmdline_popup',
        },
      }
      vim.notify = require 'notify'
    end,
  },
  {
    'echasnovski/mini.statusline',
    config = function()
      require('mini.statusline').setup {
        content = {
          active = function()
            local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
            local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
            local filename = MiniStatusline.section_filename { trunc_width = 140 }

            return MiniStatusline.combine_groups {
              { hl = mode_hl, strings = { mode } },
              '%<',
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=',
              { strings = { diagnostics } },
            }
          end,
        },
        use_icons = true,
      }
    end,
  },
}
