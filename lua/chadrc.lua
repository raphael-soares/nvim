---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "gruvchad",
    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },

}

M.ui = {
    tabufline = { enabled = false },
}

return M
