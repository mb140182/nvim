return {
  'preservim/nerdcommenter',
  lazy = false,
  --event = "VeryLazy",  -- или укажите конкретное событие, например, "BufEnter"

    keys = {}, -- Отключаем все дефолтные маппинги
    init = function()
        -- Отключаем стандартные маппинги при загрузке
        vim.g.NERDCreateDefaultMappings = 0
    end,

  config = function()
      -- Настройки NERDCommenter (опционально)
      --vim.g.NERDSpaceDelims = 1       -- Добавляет пробелы после комментариев
      --vim.g.NERDCompactSexyComs = 1   -- Использует компактные многострочные комментарии
      --vim.g.NERDDefaultAlign = 'left'  -- Выравнивание комментариев по левому краю

      vim.keymap.set('n', ',cc', '<Plug>NERDCommenterToggle', { desc = 'Toggle comment' })
      vim.keymap.set('v', ',cc', '<Plug>NERDCommenterToggle', { desc = 'Toggle comment (visual)' })

      vim.keymap.set('n', ',cm', '<Plug>NERDCommenterMinimal', { desc = 'Toggle comment' })
      vim.keymap.set('v', ',cm', '<Plug>NERDCommenterMinimal', { desc = 'Toggle comment (visual)' })

  end
}
