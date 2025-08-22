return {
  {
    "andweeb/presence.nvim",
    event = "VeryLazy", -- loads later to keep startup fast
    config = function()
      require("presence").setup({
        auto_update = true,
        neovim_image_text = "Coding in AstroNvim",
        main_image = "file",
        show_time = true,
      })
    end,
  },
}
