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

local keymaps = {
  ["n"]  = {
    -- basic cmds
    ["<leader>s"] = ':w<cr>',
    ["<leader>x"] = ':x<cr>',
    ["<leader>sa"] = ':so %<cr>',

    -- file creation
    ["<leader>nf"] = ':! touch ./ ',
    ["<leader>nd"] = ':! mkdir ./ ',

    -- kommentary plugin
    ["<leader>cic"] = "<Plug>kommentary_line_increase",
    ["<leader>ci"] = "<Plug>kommentary_motion_increase",
    ["<leader>cdc"] = "<Plug>kommentary_line_decrease",
    ["<leader>cd"] = "<Plug>kommentary_motion_decrease",

    -- window nagivation
    ["<C-h>"] = "<C-w>h",
    ["<C-j>"] = "<C-w>j",
    ["<C-k>"] = "<C-w>k",
    ["<C-l>"] = "<C-w>l",

    -- Resize with arrows
    ["<C-Up>"] = ":resize -2<CR>",
    ["<C-Down>"] = ":resize +2<CR>",
    ["<C-Left>"] = ":vertical resize -2<CR>",
    ["<C-Right>"] = ":vertical resize +2<CR>",

    -- Naviagate buffers
    ["<leader>b"]= ":bnext<CR>",
    ["<leader>bn"]= ":bnext<CR>",
    ["<leader>bp"]= ":bprevious<CR>",
    ["<leader>bw"]= ":bwipeout<CR>",

    -- Move text up and down
    ["<A-k>"] = "<Esc>:m .-2<CR>==gi",
    ["<A-j>"] = "<Esc>:m .+1<CR>==gi",
  },
  ["v"]  = {
    -- Stay in indent mode
    ["<"] = "<gv",
    [">"] = ">gv",

    -- Move text up and down
    ["<A-j>"] = ":m .+1<CR>==",
    ["<A-k>"] = ":m .-2<CR>==",
    -- ["p"] = '"_dP'
  },
  ["x"]  = {
    -- Move text up and down
    ["J"] = ":move '>+1<CR>gv-gv",
    ["K"] = ":move '<-2<CR>gv-gv",
    ["<A-j>"] = ":move '>+1<CR>gv-gv",
    ["<A-k>"] = ":move '<-2<CR>gv-gv",
  },


  ["i"]  = {
    -- Press jk fast to enter
    ["jk"] = "<ESC>",
  },
}

-- basic keybindings builder
for mode, maps in pairs(keymaps) do
  for key, value in pairs(maps) do
    keymap(mode, key, value, opts)
  end
end

-- Visual --

-- Custom

-- Trouble
-- keymap("n", "")

-- lsp
--
local lsp_maps = {
  ['n'] = {
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
}

for mode, maps in pairs(lsp_maps) do
  for key, value in pairs(maps) do
    keymap(mode, key, value, opts)
  end
end

local ts_maps = {
  ['n'] = {
    ["<F7>"] = "<cmd>TSHighlightCapturesUnderCursor<cr>",
    ["<F8>"] = "<cmd>TSPlaygroundToggle<cr>",
    ["<F4>"] = "<cmd>Telescope resume<cr>",
    -- ctrl-p plugin like view with telescope
    ["<C-p>"] = "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    ["<C-t>"] = "<cmd>lua vim.lsp.buf.document_symbol()<cr>",
    ["<C-s>"] = "<cmd>vsplit<cr>",
    ["<c-n>"] = ":e ~/Notes/<cr>",

  },
  ['v'] = {
    ["//"] = [[y/\V<C-R>=escape(@",'/\')<CR><CR>]],
  },
}

for mode, maps in pairs(ts_maps) do
  for key, value in pairs(maps) do
    keymap(mode, key, value, opts)
  end
end
