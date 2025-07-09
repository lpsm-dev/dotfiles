return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    -- This 'opts' table is no longer needed here
    -- opts = {}, 
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- This is the correct and final way to set it all up
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "gopls",
          "jdtls",
          "ts_ls",
          "bashls",
          "astro",
        },
        handlers = {
          -- The default handler for all servers
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,

          -- A custom handler for lua_ls
          ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  },
                },
              },
            })
          end,
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Your vim.diagnostic and keymap settings remain here
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Actions" })
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover Documentation" })
      vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { desc = "Go to References" })
    end,
  },
}
