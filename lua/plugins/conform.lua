return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      lua        = { "stylua" },
      vue        = { "prettier" },
      typescript = { "prettier" },
      javascript = { "prettier" },
      json       = { "prettier" },
      html       = { "prettier" },
      css        = { "prettier" },
      markdown   = { "prettier" },
    },
    format_on_save = function(bufnr)
      -- desativa format-on-save se o projeto tiver um flag de opt-out
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_format = "fallback" }
    end,
    default_format_opts = {
      lsp_format = "fallback",
    },
  },
}
