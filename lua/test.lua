-- for tests 
--

--print "Pizdec"
--
---- Поиск символов в текущем файле
vim.keymap.set('n', '<leader>fs', function()
  require('telescope.builtin').lsp_document_symbols({
    symbols = {
      'class', 'function', 'method', 'struct'
    }
  })
end, { desc = "Find symbols in file" })
--
--

-- Make the current project
  vim.keymap.set('n', '<leader>mm', ':make<CR>', { noremap = true, silent = true, desc = "Run make" })

  -- Clean the project
  vim.keymap.set('n', '<leader>mc', ':make clean<CR>', { noremap = true, silent = true, desc = "Make clean" })

  -- Open quickfix list after make
  vim.keymap.set('n', '<leader>mo', ':copen<CR>', { noremap = true, silent = true, desc = "Open quickfix" })

  -- Close quickfix list
  vim.keymap.set('n', '<leader>mq', ':cclose<CR>', { noremap = true, silent = true, desc = "Close quickfix" })
-- Make the current project


-- Configure CMake project
--vim.keymap.set('n', '<leader>cm', ':!cmake -B build -DCMAKE_BUILD_TYPE=Debug<CR>', { noremap = true, desc = "CMake configure" })
vim.keymap.set('n', '<leader>cm', ':!cmake CMakeLists.txt -B build<CR>:!cmake --build build<CR>', { noremap = true, desc = "CMake configure" })

-- Build with CMake
vim.keymap.set('n', '<leader>cb', ':!cmake --build build<CR>', { noremap = true, desc = "CMake build" })

-- Build with CMake in release mode
vim.keymap.set('n', '<leader>cr', ':!cmake --build build --config Release<CR>', { noremap = true, desc = "CMake release build" })

-- Run CMake target
vim.keymap.set('n', '<leader>cr', ':!./build/<Tab>', { noremap = true, desc = "Run CMake target" })

-- Clean CMake build
--vim.keymap.set('n', '<leader>cc', ':!cmake --build build --target clean<CR>', { noremap = true, desc = "CMake clean" })
vim.keymap.set('n', '<leader>cc', ':!./CMakeClean<CR>', { noremap = true, desc = "CMake clean" })



--2025.05.31/11:06:58

-- Вставка даты и времени


--put=strftime('[%H:%M]')

--[[
local wk = require("which-key")
wk.register({
  m = {
    name = "Make",
    m = { ":make<CR>", "Run make" },
    c = { ":make clean<CR>", "Clean project" },
    o = { ":copen<CR>", "Open quickfix" },
    q = { ":cclose<CR>", "Close quickfix" },
  },
  c = {
    name = "CMake",
    m = { ":!cmake -B build<CR>", "Configure" },
    b = { ":!cmake --build build<CR>", "Build" },
    r = { ":!cmake --build build --config Release<CR>", "Release build" },
    c = { ":!cmake --build build --target clean<CR>", "Clean" },
  }
}, { prefix = "<leader>" })
]]

