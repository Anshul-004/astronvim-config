return {
  "L3MON4D3/LuaSnip",
  opts = function(_, opts)
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
  end,
}
