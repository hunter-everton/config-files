return {
    {
        "RRethy/base16-nvim",
    },

    {
        'projekt0n/github-nvim-theme',
        name = 'github-theme',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
    },

    {
        "hachy/eva01.vim",
        lazy = false,
        priority = 1000,
    },

    {
        "vague2k/vague.nvim",
    },

    {
        "sainnhe/gruvbox-material",
        config = function ()
            vim.g.gruvbox_material_background = "hard"
        end
    }


}
