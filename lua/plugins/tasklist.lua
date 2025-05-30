return {
  'vim-scripts/TaskList.vim',
  cmd = 'TaskList', -- Ленивая загрузка при вызове команды :TaskList
  keys = { -- Опционально: задайте горячие клавиши
      { ',tl', ':TaskList<CR>', desc = 'Open TaskList' }
  },
  config = function()
      -- Настройки (если нужны)
      vim.g.TaskList_Display_Threshold = 3 -- Минимальное количество задач для отображения
      vim.g.TaskList_File_Pattern = '*.py,*.js,*.lua,*.md' -- Где искать задачи
  end
}
