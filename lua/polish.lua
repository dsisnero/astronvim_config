-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.opt.spelllang = "en_us"
vim.filetype.add {
  -- extension = {
  --   foo = "fooscript",
  -- },
  -- filename = {
  --   ["Foofile"] = "fooscript",
  -- },
  -- pattern = {
  --   ["~/%.config/foo/.*"] = "fooscript",
  -- },
  filename = {
    ["Guardfile"] = "ruby",
  },
}
-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: :h api-autocmd, :h augroup
-- https://neovim.io/doc/user/autocmd.html
local function augroup(name) return vim.api.nvim_create_augroup("doms_" .. name, { clear = true }) end
-- local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- wrap and check for spell in text filetypes
autocmd("FileType", {
  group = augroup "wrap_spell",
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown", "asciidoc", "csv" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
    vim.opt_local.textwidth = 80
    -- vim.opt_local.spelllang = "en_us"
  end,
})
