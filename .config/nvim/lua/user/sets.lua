local options = {
	expandtab = true,
    hidden = true,
    incsearch = true,
    errorbells = false,
    hlsearch = false,
    wrap = false,
    ignorecase = true,
    scrolloff = 8,
    shiftwidth = 2,
    smartindent = true,
    tabstop = 2,
    softtabstop = 2,
    backup = false,
    swapfile = false,
    undofile = true,
    undodir = "/home/smc181002/.config/undodir",
    termguicolors = true,
    -- background = "dark",
    relativenumber = true,
    nu = true,
    cursorline = false,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.g.material_style = "darker"
vim.cmd "colorscheme material"
vim.cmd "highlight Normal guibg=none"
vim.cmd "set guicursor= "
