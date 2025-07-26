return {
    "tribela/transparent.nvim",
    config = function ()
        require("transparent").setup({
        auto = false,
        groups = { -- table: default groups
            'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
            'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
            'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
            'SignColumn', 'CursorLineNr', 'EndOfBuffer',
          },
        extra_groups = {
            "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
            "NeoTreeNormal",
            "NeoTreeNormalNC",
            "TelescopeNormal",
            "TelescopeBorder",
            "WhichKeyFloat",
          }, -- table: additional groups that should be cleared
        exclude_groups = {}, -- table: groups you don't want to clear
        })
        vim.keymap.set("n", "<leader>tb", ":TransparentToggle<CR>", {desc = "TransparentToggle" })
    end
}
