return {
  "loctvl842/monokai-pro.nvim",
  config = function ()
    require("monokai-pro")
    vim.cmd([[colorscheme monokai-pro]])
  end
}
