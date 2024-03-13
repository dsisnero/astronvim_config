local util = require "lspconfig.util"
local root_files = {
  "Gemfile",
  "Rakefile",
  ".solargraph.yml",
  ".git",
}
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  config = {
    ruby_ls = {
      root_dir = function(fname)
        local primary = util.root_pattern(unpack(root_files))(fname)
        -- local fallback
        return primary -- or fallback
      end,
    },
  },
}
