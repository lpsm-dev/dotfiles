return  {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim"
  },
  config = function()
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle left<CR>', { desc = "Toggle neo-tree"})
    vim.keymap.set('n', '<C-g>', ':Neotree float git_status git_base=master<CR>', { desc = "Toggle floating git changes"})
    vim.keymap.set('n', '<C-f>', ':Neotree focus<CR>', { desc = "Focuses neotree"})
  end
}
