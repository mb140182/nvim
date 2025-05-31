-- zamena tagbar
return {
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    opts = {
      -- Настройки по умолчанию
      layout = {
        min_width = 30,
        default_direction = "prefer_right"
      },
      -- Автоматически обновлять при изменениях
      update_events = "TextChanged,InsertLeave",
      -- Показывать только текущую буфер
      -- Использовать nvim-web-devicons
      nvim_web_devicons = true,
      -- Настройки для разных языков
      languages = {
        cpp = {
          ["Class"] = "",
          ["Function"] = "",
          ["Method"] = "",
          ["Constructor"] = "",
          ["Struct"] = "",
          ["Constructor"] = ""

    --[["Class",
    "Constructor",
    "Enum",
    "Function",
    "Interface",
    "Module",
    "Method",
    "Struct",]]


        },
        python = {
          ["Class"] = "",
          ["Function"] = "",
          ["Method"] = ""
        }
      }
    },
    config = function(_, opts)
      require("aerial").setup(opts)
      
      -- Клавиши для управления aerial
      --vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "Toggle Aerial" })
      --vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { desc = "Previous symbol" })
      --vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { desc = "Next symbol" })
    end,
    -- Загружать только при вызове
    cmd = "AerialToggle",
    keys = {
      { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial" },
      { "{", "<cmd>AerialPrev<CR>", desc = "Previous symbol" },
      { "}", "<cmd>AerialNext<CR>", desc = "Next symbol" }
    }
  }
}
