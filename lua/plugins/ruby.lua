return {
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "ruby_lsp" }) -- Remove solargraph
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "ruby_lsp", "rubocop" })
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
      --@diagnostic disable: missing-fields
      formatting = {
        format_on_save = {
          enabled = true,
        },
      },
      features = {
        inlay_hints = true,
      },

      operations = { -- enable all of the file operations
        willCreate = true,
        didCreate = true,
        willRename = true,
        didRename = true,
        willDelete = true,
        didDelete = true,
      },
    },
    -- Configure LSP server settings
    config = {
      ruby_lsp = {
        cmd = {
          "bundle",
          "exec",
          "ruby-lsp",
        },
        settings = {
          formatter = "rubocop",
        },
      },
    },
  },
}
