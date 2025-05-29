return {
  'preservim/tagbar',
    lazy = false,
    config = function ()
    end,
  --opts = {},
    vim.keymap.set('n', '<leader>tt', "<cmd>TagbarToggle<cr>", { desc = '[T]agBar [T]ogle' }),  --rabotaet
}
