return {
    { -- Highlight todo, notes, etc in comments
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false },
    },

    { -- edit the file system as a buffer
        'stevearc/oil.nvim',
        opts = {
            keymaps = {
                ['<C-s>'] = false,
                ['<C-h>'] = false,
                ['<C-l>'] = false,
            },
            view_options = {
                show_hidden = true,
            },
        },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        keys = {
            { '-',          ':Oil<cr>', desc = 'oil' },
            { '<leader>ef', ':Oil<cr>', desc = 'edit [f]iles' },
        },
        cmd = 'Oil',
    },

    { -- nicer-looking tabs with close icons
        'nanozuki/tabby.nvim',
        enabled = true,
        config = function()
            require('tabby.tabline').use_preset 'tab_only'
        end,
    },

    { -- terminal
        'akinsho/toggleterm.nvim',
        opts = {
            open_mapping = [[<C-\>]],
            direction = 'float',
        },
    },

    { -- show diagnostics list
        -- PERF: Slows down insert mode if open and there are many diagnostics
        'folke/trouble.nvim',
        enabled = false,
        config = function()
            local trouble = require 'trouble'
            trouble.setup {}
            local function next()
                trouble.next { skip_groups = true, jump = true }
            end
            local function previous()
                trouble.previous { skip_groups = true, jump = true }
            end
            vim.keymap.set('n', ']t', next, { desc = 'next [t]rouble item' })
            vim.keymap.set('n', '[t', previous, { desc = 'previous [t]rouble item' })
        end,
    },

    { -- show indent lines
        'lukas-reineke/indent-blankline.nvim',
        enabled = true,
        main = 'ibl',
        opts = {
            indent = { char = '│' },
            scope = { enabled = false },
        },
    },

    { -- highlight markdown headings and code blocks etc.
        'lukas-reineke/headlines.nvim',
        enabled = true,
        dependencies = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require('headlines').setup {
                quarto = {
                    query = vim.treesitter.query.parse(
                        'markdown',
                        [[
                (fenced_code_block) @codeblock
                ]]
                    ),
                    codeblock_highlight = 'CodeBlock',
                    treesitter_language = 'markdown',
                },
                markdown = {
                    query = vim.treesitter.query.parse(
                        'markdown',
                        [[
                (fenced_code_block) @codeblock
                ]]
                    ),
                    codeblock_highlight = 'CodeBlock',
                },
            }
        end,
    },
}
