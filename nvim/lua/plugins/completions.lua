return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },

    {
        -- adds function arg help while typing out functions!!!
        "hrsh7th/cmp-nvim-lsp-signature-help",
    },

    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },

    {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup {}
            require('nvim-autopairs').remove_rule '`'
        end,
    },

    { -- completion
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-calc',
            'hrsh7th/cmp-emoji',
            'saadparwaiz1/cmp_luasnip',
            'f3fora/cmp-spell',
            'ray-x/cmp-treesitter',
            'kdheepak/cmp-latex-symbols',
            'jmbuhr/cmp-pandoc-references',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
            'onsails/lspkind-nvim',
            'jmbuhr/otter.nvim',
        },
        config = function()
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'
            local lspkind = require 'lspkind'

            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                completion = { completeopt = 'menu,menuone,noinsert' },

                mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					-- ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<CR>"] = cmp.mapping.confirm({ select = false }),

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),

                autocomplete = false,

                ---@diagnostic disable-next-line: missing-fields
                formatting = {
                    format = lspkind.cmp_format {
                        mode = 'symbol',
                        menu = {
                            otter = '[🦦]',
                            nvim_lsp = '[LSP]',
                            nvim_lsp_signature_help = '[sig]',
                            luasnip = '[snip]',
                            buffer = '[buf]',
                            path = '[path]',
                            spell = '[spell]',
                            pandoc_references = '[ref]',
                            tags = '[tag]',
                            treesitter = '[TS]',
                            calc = '[calc]',
                            latex_symbols = '[tex]',
                            emoji = '[emoji]',
                        },
                    },
                },
                sources = {
                    { name = 'otter' }, -- for code chunks in quarto
                    { name = 'path' },
                    { name = 'nvim_lsp_signature_help' },
                    { name = 'nvim_lsp' },
                    { name = 'luasnip',                keyword_length = 3, max_item_count = 3 },
                    { name = 'pandoc_references' },
                    { name = 'buffer',                 keyword_length = 5, max_item_count = 3 },
                    { name = 'spell' },
                    { name = 'treesitter',             keyword_length = 5, max_item_count = 3 },
                    { name = 'calc' },
                    { name = 'latex_symbols' },
                    { name = 'emoji' },
                },
                view = {
                    entries = 'native',
                },
                window = {
                    documentation = {
                        border = require('misc.style').border,
                    },
                },
            }

            -- for friendly snippets
            require('luasnip.loaders.from_vscode').lazy_load()
            -- for custom snippets
            require('luasnip.loaders.from_vscode').lazy_load { paths = { vim.fn.stdpath 'config' .. '/snips' } }
            -- link quarto and rmarkdown to markdown snippets
            luasnip.filetype_extend('quarto', { 'markdown' })
            luasnip.filetype_extend('rmarkdown', { 'markdown' })
        end,
    },

    { -- gh copilot
        'zbirenbaum/copilot.lua',
        enabled = false,
        config = function()
            require('copilot').setup {
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = '<c-a>',
                        accept_word = false,
                        accept_line = false,
                        next = '<M-]>',
                        prev = '<M-[>',
                        dismiss = '<C-]>',
                    },
                },
                panel = { enabled = false },
            }
        end,
    },
}
