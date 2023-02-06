require("nvim-treesitter.configs").setup {
  ensure_installed = "all",
  sync_install = false,
  autopairs = {
    enable = true
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = true,

  },
  indent = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  },
  -- playground = {
  --   enable = true
  -- }
  -- context_commentstring = {
  --   enable = true,
  --   enable_autocmd = false
  -- }
}
