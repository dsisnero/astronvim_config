return {
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "ruby_lsp" }) -- Remove solargraph
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "ruby_lsp", "rubocop" })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = { "suketa/nvim-dap-ruby", config = true },
  },
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@type AstroLSPOpts
    opts = {
      formatting = {
        format_on_save = {
          enabled = true,
          allow_filetypes = { "ruby" },
        },
      },
      -- Configure LSP server settings
      config = {
        ruby_ls = function(opts)
          opts.cmd = { "ruby-lsp" } -- Explicitly set the command
          opts.settings = {
            rubyLsp = {
              formatter = "rubocop",
              rubocop = {
                onSave = true
              }
            }
          }
          return opts
        end
      }
    }
  }
}
