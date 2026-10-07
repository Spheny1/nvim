return {
  "nickjvandyke/opencode.nvim",
  config = function()
    vim.keymap.set({ "n", "x" }, "<leader>aa", function()
      require("opencode").ask("@this: ")
    end, { desc = "Ask OpenCode" })

    vim.keymap.set({ "n", "x" }, "<leader>as", function()
      require("opencode").select()
    end, { desc = "Select OpenCode action" })
  end,
}
