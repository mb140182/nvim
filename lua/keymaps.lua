-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- 2025.05.18/18:27:37
-- --------------------------------------------------------------------------------

--vim.keymap.set('n', '<F5>', ':bn<CR>', { desc = 'Move focus to the upper window' })

-- Вставка времени даты
--vim.keymap.set('n', '<leader>tt', ':put=strftime(\'%H:%M\')<CR>', { desc = 'Insert current time' })
--vim.keymap.set('n', '<leader>dt', ':put=strftime(\'%Y-%m-%d %H:%M\')<CR>', { desc = 'Insert datetime' })
vim.keymap.set('n', ',icd', ':put=strftime(\'%Y.%m.%d/%H:%M:%S\')<CR>', { desc = 'Insert current datetime' })
vim.keymap.set('n', ',icsd', ':put=strftime(\'%Y%m%d%H%M%S\')<CR>', { desc = 'Insert current datetime short' })



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


