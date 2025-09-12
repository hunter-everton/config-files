return {
    { "mason-org/mason.nvim", opts = {} },

    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        opts = {},
        config = function()
            require("mason-lspconfig").setup({
                automatic_enable = true,
            })
        end,
    },
}
