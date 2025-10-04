return {
  {
    "m00qek/baleia.nvim",
    version = "*",
    config = function()
      vim.g.conjure_baleia = require("baleia").setup({ line_starts_at = 3 })

      local augroup = vim.api.nvim_create_augroup("ConjureBaleia", { clear = true })

      vim.api.nvim_create_user_command("BaleiaColorize", function()
        vim.g.conjure_baleia.once(vim.api.nvim_get_current_buf())
      end, { bang = true })

      vim.api.nvim_create_user_command("BaleiaLogs", vim.g.conjure_baleia.logger.show, { bang = true })
    end,
  },
  {
    "Olical/conjure",
    ft = { "clojure", "fennel" },
    config = function()
      require("conjure.main").main()
      require("conjure.mapping")["on-filetype"]()
    end,
    init = function()
      vim.g["conjure#log#strip_ansi_escape_sequences_line_limit"] = 1

      -- Disable diagnostics in log buffer and colorize it
      vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
        pattern = "conjure-log-*",
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          vim.diagnostic.enable(false, { bufnr = buffer })
          vim.g.conjure_baleia.automatically(buffer)
        end,
      })
    end,
  },
  {
    "PaterJason/cmp-conjure",
    config = function()
      require'cmp'.setup{
        sources = {
          { name = 'conjure' }
        }
      }
    end,
  }
}
