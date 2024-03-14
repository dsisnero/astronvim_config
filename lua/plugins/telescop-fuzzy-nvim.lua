return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzy-native.nvim",
      build = "make",
      cond = function() return vim.fn.executable "make" == 1 end,
    },
    opts = function() require("telescope").load_extension "fzy_native" end,
  },
  {
    "NeogitOrg/neogit",
    optional = true,
    opts = { telescope_sorter = function() return require("telescope").extensions.fzy_native.native_fzy_sorter() end },
  },
}
