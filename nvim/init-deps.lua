vim.filetype.add({
  pattern = {
    [".*/hypr/.*.conf"] = "hyprlang",
    [".*/waybar/config"] = "jsonc"
  }
})
