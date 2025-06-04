-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false    -- не показывать режим (--INSERT и тп) в самом низу

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- vim: ts=2 sts=2 sw=2 et



-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- 2025.05.21/15:26:18
-- --------------------------------------------------------------------------------
-- устанавливаем настройки табуляции и отступов
-- Перенос строк
vim.o.breakindent = true                -- Enable break indent - при переносе строки добавлять отступы
--vim.o.showbreak = '>>> '
vim.o.showbreak = '↳↳↳ '
--opt.wrap = true                       -- включить перенос строк (по умолчанию обычно true)
vim.opt.linebreak = true                -- Устанавливаем перенос по словам, а не по буквам

-- Отображение различных символов
vim.opt.list = true
vim.opt.listchars = {
  tab = '→ ',
  trail = '·',
  nbsp = '␣',
  extends = '❯',
  precedes = '❮'
}

-- Отступы и форматирование текста
vim.opt.tabstop = 2                     -- на сколько пробелов заменяется символ табуляции при отображении
vim.opt.softtabstop = 2                 -- ширина отступа
vim.opt.shiftwidth = 2                  -- количество пробелов, вставляемых при шифтинге
vim.opt.autoindent = true
vim.opt.expandtab = true      -- use spaces instead of tabs В режиме Вставки при включённой опции 'expandtab' для вставки символа <Tab> используется соответствующее количество пробелов. Пробелы, кроме того, используются в отступах, которые вставляются по командам '<' и '>'
vim.opt.smartindent = true    -- autoindent new lines

-- Show which line your cursor is on
vim.o.cursorline = true
vim.o.cursorcolumn = false
vim.o.colorcolumn = '80'

--[[  XXX: TODO: разобраться
vim.opt.textwidth = 80
vim.opt.colorcolumn = "+1,+21"-- граница на [textwidth]+N
vim.opt.formatoptions = {
  c = true, -- форматировать комментарии по textwidth
  j = true, -- удалять лишние комментарии при J
  l = true, -- не форматировать длинные строки в Insert
  n = true, -- распознавать списки
  q = true, -- разрешить gq
  r = true, -- продолжить комментарий на новой строке
  t = true, -- переносить текст (нужно для переноса комментариев)
}
]]

-- Прокрутка
--vim.opt.scrolloff=999                   -- Курсор всегда в центре экрана
vim.opt.scrolloff = 10                   -- Сколько строк отображать после курсора при вертикальной прокрутке
vim.opt.sidescrolloff = 8               -- Аналог для горизонтальной прокрутке (при wrap=true не имеет эффекта)

--cmd([[
--filetype indent plugin on
--syntax enable
--]])


vim.opt.fileformat = 'unix'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = 'utf-8,cp936,cp1251'

vim.opt.keymap = 'russian-jcukenwin'    -- Поддержка русского языка ввода
vim.opt.iminsert = 0                    -- Чтобы при старте ввод был на английском, а не русском 
vim.opt.imsearch = 0                    -- Чтобы при старте ввод был на английском, а не русском 
vim.opt.spell = true                       -- spell
vim.opt.spelllang= { 'en_us', 'ru_ru' }    -- Словари рус eng


vim.opt.number = true                   -- Включаем нумерацию строк
--vim.opt.relativenumber = true           -- Вкл. относительную нумерацию строк
vim.opt.splitright = true               -- vertical split вправо
vim.opt.splitbelow = true               -- horizontal split вниз

vim.opt.hidden = true                   -- Перемещатся по буферам без сохранения текста, но с сохранением истории редактирования

vim.opt.mousehide = true                -- Скрывать указатель мыши, когда печатаем

vim.opt.autochdir = true                -- Скрывать указатель мыши, когда печатаем

vim.opt.hlsearch = true                 -- Включаем подсветку выражения, которое ищется в тексте
vim.opt.incsearch = true                -- При поиске перескакивать на найденный текст в процессе набора строки
vim.opt.wrapscan = false                -- Останавливать поиск при достижении конца файла
vim.opt.ignorecase = true               -- Игнорировать регистр букв при поиске
vim.o.smartcase = true                  -- автоматически учитывающим регистр, но только если в поисковом запросе есть заглавные буквы, откючаетса добавлением '\c' к запросу
vim.o.inccommand = 'split'              -- это интерактивный предпросмотр результатов при выполнении команд замены (:s) или глобальных команд (:g)

--[[  XXX: TODO: разобраться
opt.grepformat = "%f:%l:%c:%m"
-- Настройка ripgrep вместо grep
-- sudo pacman -S ripgrep
if vim.fn.executable('rg') == 1 then
  opt.grepprg = "rg --vimgrep --smart-case --hidden"
end
]]


-- swapfile undo backup +++
  local PathHome =  vim.fn.getenv("HOME")
  local PathUndo = PathHome .. '/tmp/state/nvim/undo'

  vim.opt.backup = false                  -- Отключаем создание бэкапов
  vim.opt.writebackup = false             -- Отключаем создание бэкапов временных - ~file_name 
  vim.opt.swapfile = false                -- выключаем своп файл

  vim.opt.backupdir = PathHome .. '/TEMP' --Папка для бекапов

  if vim.fn.isdirectory(PathUndo) == 0 then
    vim.fn.mkdir(PathUndo, 'p')
  end

  -- В Neovim shada (от SHAred DAta) — это аналог viminfo TODO: разобратся
  --vim.opt.shada = "!,'1000,<50,s10,h" -- ограничения для shada-файлов (от share data)
  --vim.opt.shadafile = "~/.config/nvim/shada/main.shada" -- место где хранится файл shada

  vim.o.confirm = true                    -- Запрашивать подтверждение перед выходом, если есть несохранённые изменения
  --vim opt.autoread = true                -- Обновлять буфер при изменении файла извне

  vim.opt.undofile = true                 -- Возможность отката назад
  vim.opt.undolevels = 1000
-- swapfile undo backup ---

--Фолдинг
--"set foldenable
--"set fdm=indent
--vim.opt.foldmethod = 'syntax'
vim.opt.foldmethod = 'indent'             -- FIXME: не работает по syntax
vim.opt.foldlevel = 5 -- 99             -- Управляет уровнем сворачивания (folding) текста. По умолчанию всё развёрнуто
vim.opt.foldlevelstart = 3                -- Применяется только при открытии файла
--vim.opt.foldnestmax = 3                 -- Максимальная вложенность
vim.opt.foldminlines = 5                -- Минимальное число строк для создания свёртки
vim.opt.foldenable = true


vim.opt.showcmd = true                  -- Показывать незавершённые команды в статусбаре
vim.opt.cmdheight = 2                   --  Поджирает строку снизу, но проблему решает -- more space in the neovim command line for displaying messages
--vim.opt.laststatus=2                  -- Всегда показывать строку состояния
vim.opt.showmode = false                -- не показывать режим (--INSERT и тп) в самом низу
--vim.opt.shortmess:append("I")         -- Убрать приветствие

vim.opt.visualbell = true               --Опция позволяет использовать "визуальный звонок" вместо звукового сигнала.
vim.opt.errorbells = true               --Опция управляет выдачей сигнала (с использованием системного динамика или при помощи моргания экрана)

vim.opt.termguicolors = true

vim.o.clipboard = 'unnamedplus'
-- test ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Таймауйты
vim.opt.timeoutlen = 1000 -- для ввода сочетания
vim.opt.updatetime = 250  -- всплывающие окна

--TODO
--if vim.fn.isdirectory(PathUndo) == 0 then
    --print("Директория существует"..PathUndo)
--else
    --print("Директория не существует"..PathUndo)
--end

--vim.cmd.colorscheme('catppuccin-latte')
