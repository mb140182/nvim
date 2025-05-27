return {

  --{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        mode = 'buffers', -- "buffers" или "tabs"
        numbers = 'ordinal', -- "none" | "ordinal" | "buffer_id"
        close_command = 'bdelete! %d', -- Команда для закрытия буфера
        right_mouse_command = 'bdelete! %d', -- ПКМ для закрытия
        left_mouse_command = 'buffer %d', -- ЛКМ для переключения
        middle_mouse_command = nil, -- СКМ действие
        indicator = {
          style = 'icon', -- 'icon' | 'underline' | 'none'
        },
        buffer_close_icon = '󰅖',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = ' ',
        right_trunc_marker = ' ',
        separator_style = 'thin', -- "slant" | "slope" | "thick" | "thin"
        diagnostics = 'nvim_lsp', -- "false" | "nvim_lsp" | "coc"
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    },
  },
}
