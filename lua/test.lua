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

--2025.05.31/11:06:58

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

