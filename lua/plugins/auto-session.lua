return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
    require("auto-session").setup {
      auto_restore_enabled = true,
      auto_save_enabled = true,  
      auto_session_suppress_dirs = { "~/", "/" }, -- don’t save sessions for these
    }
  end,
}
