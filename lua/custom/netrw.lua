-- Limit netrw size to 20%
vim.g.netrw_winsize = 20

-- Disable top banner
vim.g.netrw_banner = 0

-- Keeps the current directory and the netre directory as the same
-- Helps avoiding errors while moving files
vim.g.netrw_keepdir = 0

-- Show directories first
vim.g.netrw_sort_sequence = [[[\/]$,*]]

-- Human-readable files sizes
vim.g.netrw_sizestyle = 'H'

-- List style
vim.g.netrw_liststyle = 3

-- Open files on split
vim.g.netrw_browse_split = 4

-- Highlight marked files in the same way search matches are
vim.cmd 'hi! link netrwMarkFile Search'

-- Recursive copy of directories
vim.g.netrw_localcopydircmd = 'cp -r'

-- Toggle netrw
vim.keymap.set('n', '<leader>n', ':Lexplore<CR>', { silent = true })

-- Netrw mappings
vim.api.nvim_create_autocmd('filetype', {
  pattern = 'netrw',
  desc = 'Better mappings for netrw',
  callback = function()
    local bind = function(lhs, rhs)
      vim.api.nvim_buf_set_keymap(0, 'n', lhs, rhs, { silent = true })
    end

    -- Toggle dotfiles
    bind('.', 'gh')

    -- Use <C-l> to move from netrw
    bind('<C-l>', '<C-w>l')

    -- Open on vertical split
    bind('v', '<CR>:vsplit<CR><C-w>h<C-o><C-w>l')

    -- Open on horizontal split
    bind('h', '<CR>:split<CR><C-w>k<C-o><C-w>j')
  end,
})
