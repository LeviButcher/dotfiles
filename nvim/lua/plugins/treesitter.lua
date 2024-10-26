return {
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
    { "nvim-treesitter/playground" },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" }
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" }
    },
}
