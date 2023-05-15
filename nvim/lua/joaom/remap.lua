vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-- write some cool keymap for me
vim.keymap.set("n", "<C-S>", ":w<CR>")

-- Josean keymaps
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>nh", "<ESC>")
-- vim.keymap.set("n", "x", "_x") -- nao funcionou (era pro x nao mandar pra memoria)
vim.keymap.set("n", "<leader>+", "<C-a>")
vim.keymap.set("n", "<leader>-", "<C-x>")

vim.keymap.set("n", "<leader>sv", "<C-w>v")         -- split window vertically
vim.keymap.set("n", "<C-L>", "<C-w>v")              -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s")         -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=")         -- make split windows equal width
vim.keymap.set("n", "<leader>sx", ":close<CR>")     -- close current split window

vim.keymap.set("n", "<C-N>", ":tabnew<CR>")         -- open new tab

vim.keymap.set("n", "<leader>tt", ":tabnew<CR>")    -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>")  -- close current tab
vim.keymap.set("n", "<C-I>", ":tabn<CR>")           -- go to next tab
vim.keymap.set("n", "<leader><S-Tab>", ":tabp<CR>") -- go to previous tab
vim.keymap.set("n", "<C-q>", ":tabclose<CR>")       -- close new tab

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<C-Left>", "<C-w><Left>")
vim.keymap.set("n", "<C-Right>", "<C-w><Right>")

vim.keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>ps", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>pc", "<cmd>Telescope grep_string<CR>")
vim.keymap.set("n", "<leader>pb", "<cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<leader>ph", "<cmd>Telescope help_tags<CR>")

-- lspsaga
vim.keymap.set("n", "<C-k>", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Move o selecionado para cima e para baixo (alt no vscode)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-up>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<C-f>", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


-- Insert empty line without entering insert mode
vim.keymap.set('n', '<leader>o', ':<C-u>call append(line("."), repeat([""], v:count1))<CR>')
vim.keymap.set('n', '<leader>O', ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>')

vim.keymap.set('n', '<leader>C', ':keepjumps normal! ggyG<cr>')

-- go to beginning/end of line
vim.keymap.set('n', 'H', '_')
vim.keymap.set('n', 'L', '$')
