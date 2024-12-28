vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = false
vim.g.netrw_altfile = 1

-- Ensure the required modules exist and are correctly configured
local function safe_require(module)
    local ok, err = pcall(require, module)
    if not ok then
        vim.api.nvim_err_writeln("Error loading module '" .. module .. "': " .. err)
    end
end

safe_require("options")
safe_require("keymaps")
safe_require("commands")
safe_require("lazy-bootstrap")
safe_require("lazy-plugins")

-- ...additional configurations if needed...
