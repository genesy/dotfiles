  return {
    'ojroques/nvim-osc52',
    cond = function()
      -- true if we're in an SSH session
      return (vim.env.SSH_TTY or vim.env.SSH_CONNECTION) ~= nil
    end,
    init = function()
      -- Make the system clipboard use OSC52 when this plugin is active
      local function copy(lines, _)
        require("osc52").copy(table.concat(lines, "\n"))
      end
      local function paste()
        return { vim.fn.getreg('"'), vim.fn.getregtype('"') }
      end
      vim.g.clipboard = {
        name = "osc52",
        copy = { ["+"] = copy, ["*"] = copy },
        paste = { ["+"] = paste, ["*"] = paste },
      }

      -- So all yanks go to "+" which we routed to OSC52
      vim.opt.clipboard:append("unnamedplus")
    end,
    
    keys = {
      -- Operator-pending yank that copies via OSC52
      { "<leader>y", function() require("osc52").copy_operator() end, mode = "n", desc = "Yank via OSC52 (op)" },
      { "<leader>y", function() require("osc52").copy_visual()   end, mode = "x", desc = "Yank via OSC52 (visual)" },
      { "<leader>yy", function() require("osc52").copy_operator() end, mode = "n", desc = "Yank line via OSC52", remap = true },
    },
  }
