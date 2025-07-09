return {
  {
      'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()  
  require('telescope').setup {
    defaults = {    
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--hidden',  -- Include hidden files
        },
      hidden = true,  -- Enable hidden files in finders
    },
    pickers = {
      find_files = {
          hidden = true,  -- Ensure hidden files are included in find_files
        },
      },
    }
    
    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = "Fuzzy Find (telescope)"})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Fuzzy Grep (telescope)"})
  
  end

  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({ 
        extensions = { 
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
