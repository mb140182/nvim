-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

-- XXX: +++ key primer
--nnoremap("<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Set breakpoint")
--nnoremap("<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "Set conditional breakpoint")
--nnoremap("<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", "Set log point")
--nnoremap('<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>", "Clear breakpoints")
--nnoremap('<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>', "List breakpoints")

--nnoremap("<leader>dc", "<cmd>lua require'dap'.continue()<cr>", "Continue")
--nnoremap("<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", "Step over")
--nnoremap("<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", "Step into")
--nnoremap("<leader>do", "<cmd>lua require'dap'.step_out()<cr>", "Step out")
--nnoremap('<leader>dd', "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect")
--nnoremap('<leader>dt', "<cmd>lua require'dap'.terminate()<cr>", "Terminate")
--nnoremap("<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", "Open REPL")
--nnoremap("<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", "Run last")
--nnoremap('<leader>di', function() require"dap.ui.widgets".hover() end, "Variables")
--nnoremap('<leader>d?', function() local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes) end, "Scopes")
--nnoremap('<leader>df', '<cmd>Telescope dap frames<cr>', "List frames")
--nnoremap('<leader>dh', '<cmd>Telescope dap commands<cr>', "List commands")
-- XXX: --- key primer

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'mason-org/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    --'theHamsta/nvim-dap-virtual-text', -- XXX: del it

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
  },
  keys = {
    -- Basic debugging keymaps, feel free to change to your liking!
    {
      '<F5>',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<F1>',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',
    },
    {
      '<F2>',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step Over',
    },
    {
      '<F3>',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',
    },
    {
      '<leader>b',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<leader>B',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Debug: Set Breakpoint',
    },
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    {
      '<F7>',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debug: See last session result.',
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
        'codelldb',
        --'cppdbg',
      },
    }

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    -- Change breakpoint icons
     vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
     vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
     local breakpoint_icons = vim.g.have_nerd_font
         and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
       or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
     for type, icon in pairs(breakpoint_icons) do
       local tp = 'Dap' .. type
       local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
       vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
     end


-- gdb mb14 20250527093029
--
      -- Конфигурация адаптера для C/C++
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }
      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },

        { -- for cmake
          name = "CMake Debug",
          type = "codelldb",
          request = "launch",
          program = function()
            --local build_type = vim.fn.input("Build type [Debug/Release]: ", "Debug")
            --return "${workspaceFolder}/build/" .. build_type .. "/your_app_name"

            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/debug/", "file")

          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
          setupCommands = {
            {
              text = "-enable-pretty-printing",
              description = "enable pretty printing",
              ignoreFailures = false,
            },
          },
        },


        { -- FIXME: K serveru vrode podkluchaetsa, a vivod terminal ne podkluchaetsa.
          name = "Attach to server :1234",
          type = "codelldb",
          request = "attach",
          --MIMode = "gdb",
          --miDebuggerServerAddress = "localhost:1234",
          --miDebuggerPath = "/usr/bin/gdb",
          cwd = "${workspaceFolder}",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,

          pid = function()
             local name = vim.fn.input('Executable name (filter): ')
             return require("dap.utils").pick_process({ filter = name })
          end,

        },
      }

      dap.configurations.c = dap.configurations.cpp


    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    require('dap-go').setup {
      delve = {
        -- On Windows delve must be run attached or it crashes.
        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        detached = vim.fn.has 'win32' == 0,
      },
    }
  end,
}
