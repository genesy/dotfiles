return {
  "ojroques/nvim-osc52",
  config = function()
    local osc52 = require("osc52")

    -- Yank to system clipboard via OSC52
    vim.api.nvim_create_autocmd("TextYankPost", {
      callback = function()
        if vim.v.event.operator == "y" and (vim.v.event.regname == "" or vim.v.event.regname == "+" or vim.v.event.regname == "*") then
          osc52.copy_register(vim.v.event.regname == "" and '"' or vim.v.event.regname)
        end
      end,
    })

    -- Make `"+y` and `"*y` use OSC52 explicitly
    vim.g.clipboard = {
      name = "osc52",
      copy = {
        ["+"] = function(lines, _)
          osc52.copy(table.concat(lines, "\n"))
        end,
        ["*"] = function(lines, _)
          osc52.copy(table.concat(lines, "\n"))
        end,
      },
      paste = {
        ["+"] = function()
          return { vim.fn.getreg("+") }, vim.fn.getregtype("+")
        end,
        ["*"] = function()
          return { vim.fn.getreg("*") }, vim.fn.getregtype("*")
        end,
      },
    }

    -- Optionally: send unnamed yanks to + automatically
    vim.opt.clipboard:append("unnamedplus")
  end,
}
