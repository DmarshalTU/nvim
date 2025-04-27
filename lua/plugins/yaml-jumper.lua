return {
    "DmarshalTU/yaml-jumper",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("yaml-jumper").setup()
    end,
    ft = { "yaml", "yml" },
}
