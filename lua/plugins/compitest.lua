return {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  config = function()
    require("competitest").setup {
       -- default settings
      compile_command = {
        cpp = { exec = "g++", args = { "-std=c++17", "-O2", "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
        c = { exec = "gcc", args = { "$(FNAME)", "-o", "$(FNOEXT)" } },
        java = { exec = "javac", args = { "$(FNAME)" } },
        python = { exec = "python3", args = { "$(FNAME)" } },
      },

      run_command = {
        cpp = { exec = "./$(FNOEXT)" },
        c = { exec = "./$(FNOEXT)" },
        java = { exec = "java", args = { "$(FNOEXT)" } },
        python = { exec = "python3", args = { "$(FNAME)" } },
      },

      -- output/input handling
      testcases_directory = "./testcases",
      testcases_input_file_format = "input$(TCNUM).txt",
      testcases_output_file_format = "output$(TCNUM).txt",
      evaluate_template_modifiers = true,
      
      --Problems Path
      received_problems_path = "$(HOME)/Code-Playground/CP/$(JUDGE)/$(JAVA_TASK_CLASS).$(FEXT)",
      received_contests_directory = "$(HOME)/Code-Playground/CP/$(JUDGE)/$(CONTEST)", 
      received_contests_problems_path = "$(JAVA_TASK_CLASS).$(FEXT)",

      -- UI
      floating_border = "rounded",
      floating_border_highlight = "FloatBorder",
      floating_win_options = { winblend = 10 },
    }
    vim.api.nvim_create_user_command("CR", function()
      vim.cmd("CompetiTest run")
    end, {})

    vim.api.nvim_create_user_command("CP", function()
      vim.cmd("CompetiTest receive problem")
    end, {})

    vim.api.nvim_create_user_command("CC", function()
      vim.cmd("CompetiTest receive contest")
    end, {})

 end,
}

