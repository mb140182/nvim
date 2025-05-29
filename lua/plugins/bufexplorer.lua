return {
  { "jlanzarotta/bufexplorer",
--[[
\<Leader\>be normal open
\<Leader\>bt toggle open / close
\<Leader\>bs force horizontal split open
\<Leader\>bv force vertical split open
]]

      --vim.keymap.set('n', '<leader>tq', "<cmd>BufExplorer<cr>", { desc = '[B]ufExplorer [W]ord' }),  --rabotaet
--Dla primera
      --vim.keymap.set('n', '<leader>tq', "<cmd>BufferListOpen<cr>", { desc = '[S]earch current [W]ord' }),  --rabotaet

    --keys = {
      --{
        --'<leader>f',
        --function()
          --require('conform').format { async = true, lsp_format = 'fallback' }
        --end,
        --mode = '',
        --desc = '[F]ormat buffer',
      --},
    --},

  }
}
