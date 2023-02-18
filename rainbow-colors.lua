require("nvim-treesitter.configs").setup {
  ensure_installed = { "c", "lua", "vim", "help", "cpp" },
  highlight = {
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
