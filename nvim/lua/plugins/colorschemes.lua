return {
    {
        "RRethy/base16-nvim",
        config = function ()
            -- vim.cmd.colorscheme "base16"
        end
    },

    {
        "hachy/eva01.vim",
        lazy = false,
        priority = 1000,
        config = function()
            --        vim.cmd("colorscheme eva01")
        end
    },

    {
        "vague2k/vague.nvim",
        config = function ()
            require("vague").setup({
                transparent = true,
            })
            vim.cmd.colorscheme "vague"
        end
    }


}
