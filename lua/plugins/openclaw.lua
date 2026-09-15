return {
  {
    "njg7194/openclaw.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- Options go here
      gateway_path = "openclaw", -- Path to your openclaw CLI binary
      auto_start = true,         -- Automatically start the gateway on boot
    },
    config = function(_, opts)
      require("openclaw").setup(opts)
      
      -- Keymaps for quick gateway controls
      vim.keymap.set("n", "<leader>as", "<cmd>OpenClawStart<cr>", { desc = "Start OpenClaw Gateway" })
      vim.keymap.set("n", "<leader>ax", "<cmd>OpenClawStop<cr>", { desc = "Stop OpenClaw Gateway" })
      vim.keymap.set("n", "<leader>ar", "<cmd>OpenClawRestart<cr>", { desc = "Restart OpenClaw Gateway" })
    end
  }
}
