---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.disabled = {
  n = {
    ["<leader>x"] = "",
  }
}

-- more keybinds!
M.tabufline = {
  n = {
    ["<A-x>"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.telescope = {
  n = {
    -- Telescope
    ["<leader>ff"] = {"<cmd> Telescope <CR>", "Telescope"},
    --["<leader>fs"] = {"<"}
  }
}

return M
