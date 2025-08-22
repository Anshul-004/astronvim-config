-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  opts = {
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true,
      notifications = true,
    },
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    filetypes = {
      extension = { foo = "fooscript" },
      filename = { [".foorc"] = "fooscript" },
      pattern = { [".*/etc/foo/.*"] = "fooscript" },
    },
    options = {
      opt = {
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
      },
      g = {},
    },
    mappings = {
      n = {
        -- buffer navigation
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- 🚀 Custom compile & run mapping
        ["<leader>r"] = {
          function()
            local file = vim.fn.expand("%:p")
            local ft = vim.bo.filetype
            local run_cmd = ""

            if ft == "cpp" then
              run_cmd = "g++ " .. file .. " -o a.out && ./a.out < input.txt > output.txt"
            elseif ft == "c" then
              run_cmd = "gcc " .. file .. " -o a.out && ./a.out < input.txt > output.txt"
            elseif ft == "java" then
              run_cmd = "javac " .. file .. " && java " .. vim.fn.expand("%:t:r") .. " < input.txt > output.txt"
            elseif ft == "python" then
              run_cmd = "python3 " .. file .. " < input.txt > output.txt"
            end

            if run_cmd ~= "" then
              vim.cmd("split | terminal " .. run_cmd)
            else
              print("No run command for filetype: " .. ft)
            end
          end,
          desc = "Compile & Run with input/output redirection",
        },
      },
    },
  },
}
