return {
    {
        "RRethy/base16-nvim",
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
