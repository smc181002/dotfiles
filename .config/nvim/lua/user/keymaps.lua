local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- basic commands
keymap("n", "<leader>s", ":w<cr>", opts)
keymap("n", "<leader>x", ":x<cr>", opts)
keymap("n", "<leader>sa", ":so %<cr>", opts)

-- file creation
keymap("n", "<leader>nf", ":! touch ./", opts)
keymap("n", "<leader>nd", ":! mkdir ./", opts)

-- kommentary plugin
keymap("n", "<leader>cic", "<Plug>kommentary_line_increase", opts)
keymap("n", "<leader>ci", "<Plug>kommentary_motion_increase", opts)
keymap("x", "<leader>ci", "<Plug>kommentary_visual_increase", opts)
keymap("n", "<leader>cdc", "<Plug>kommentary_line_decrease", opts)
keymap("n", "<leader>cd", "<Plug>kommentary_motion_decrease", opts)
keymap("x", "<leader>cd", "<Plug>kommentary_visual_decrease", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Naviagate buffers
keymap("n", "<leader>", ":bnext<CR>", opts)
keymap("n", "<leader>bn", ":bnext<CR>", opts)
keymap("n", "<leader>bp", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Custom

-- lsp
--
local lsp_maps = {
  ["gd"] = ":lua vim.lsp.buf.definition()<cr>",
  ["gD"] = ':lua vim.lsp.buf.declaration()<cr>',
  ["gi"] = ':lua vim.lsp.buf.implementation()<cr>',
  ["gw"] = ':lua vim.lsp.buf.workspace_symbol()<cr>',
  ["gr"] = ':lua vim.lsp.buf.references()<cr>',
  ["gt"] = ':lua vim.lsp.buf.type_definition()<cr>',
  ["K"] = ':lua vim.lsp.buf.hover()<cr>',
  ["<c-k>"] = ':lua vim.lsp.buf.signature_help()<cr>',
  ["<leader>af"] = ':lua vim.lsp.buf.code_action()<cr>',
  ["<leader>rn"] = ':lua vim.lsp.buf.rename()<cr>',
}

for k, v in pairs(lsp_maps) do
  keymap("n", k, v, opts)
end

-- tree sitter
--
keymap("n", "<F7>", "<cmd>TSHighlightCapturesUnderCursor<cr>", opts)
keymap("n", "<F8>", "<cmd>TSPlaygroundToggle<cr>", opts)
keymap("v", "//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], opts)
keymap("n", "<F4>", "<cmd>Telescope resume<cr>", opts)
keymap("n", "<F5>", "<cmd>Telescope commands<CR>", opts)
-- ctrl-p plugin like view with telescope
keymap(
  "n",
  "<C-p>",
  "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
  opts
)
keymap("n", "<C-t>", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
keymap("n", "<C-s>", "<cmd>vsplit<cr>", opts)
keymap("n", "<c-n>", ":e ~/Notes/<cr>", opts)
