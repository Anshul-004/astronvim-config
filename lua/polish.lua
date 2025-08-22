-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
--Close Terminal if success code exec
vim.api.nvim_create_autocmd("TermClose", {
  pattern = "*",
  callback = function()
    if vim.v.event.status == 0 then -- only if success
      vim.cmd("close")
    end
  end,
})

