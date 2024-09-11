local function map(mod, lhs, rhs)
	vim.keymap.set(mod, lhs, rhs, {silent = true})
end

-- Normal Mode
map("n", "<leader>pf", "<CMD>Ex<CR>")
map("n", "<leader><leader>", "<CMD>w<CR>")

-- Insert Mode
map("i", "jj", "<ESC>")

-- Buffer
map("n", "<TAB>", "<CMD>bnext<CR>")
map("n", "<S-TAB>", "<CMD>bprevious<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")
