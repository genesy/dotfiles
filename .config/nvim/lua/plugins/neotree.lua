return {
  'nvim-neo-tree/neo-tree.nvim',
  cond = not vim.g.vscode,
  branch = 'v3.x',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    local function open_last_harpoon_file()
      local harpoon = require('harpoon')
      local list = harpoon:list()
      if list['items'][1] == nil then
        return
      end

      local last_item = list['items'][1]['value']

      vim.cmd('e ' .. last_item)
    end
    require('neo-tree').setup({
      close_if_last_window = true,
      enable_diagnostics = true,
      use_default_mappings = false,
      auto_expand_width = true,
      open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' },
      filesystem = {
        follow_current_file = { enabled = true },
      },
      window = {
        width = 30,
        mappings = {
          ['a'] = {
            'add',
            config = {
              show_path = 'relative', -- "none", "relative", "absolute"
            },
          },

          ['A'] = 'add_directory', -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
          ['o'] = {
            'open',
          },
          ['d'] = 'delete',
          ['r'] = 'rename',
          ['y'] = 'copy_to_clipboard',
          ['x'] = 'cut_to_clipboard',
          -- ['l'] = 'focus_preview',
          ['S'] = 'open_split',
          ['s'] = 'open_vsplit',
          ['t'] = 'open_tabnew',
          ['z'] = 'close_all_nodes',
          ['p'] = 'paste_from_clipboard',
          ['c'] = 'copy', -- takes text input for destination, also accepts the optional config.show_path option like "add":
          ['R'] = 'refresh',
          ['m'] = 'move',

          ['?'] = 'show_help',

          ['<'] = 'prev_source',
          ['>'] = 'next_source',
          ['i'] = 'show_file_details',
          ['<esc>'] = 'cancel', -- close preview or floating neo-tree window
          ['<2-LeftMouse>'] = 'open',
          ['P'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = true } },
          ['h'] = 'close_node',
          -- ['s'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
          -- ['sc'] = { 'order_by_created', nowait = false },
          -- ['sd'] = { 'order_by_diagnostics', nowait = false },
          -- ['sm'] = { 'order_by_modified', nowait = false },
          -- ['sn'] = { 'order_by_name', nowait = false },
          -- ['ss'] = { 'order_by_size', nowait = false },
          -- ['st'] = { 'order_by_type', nowait = false },
        },
      },
    })
  end,
}
