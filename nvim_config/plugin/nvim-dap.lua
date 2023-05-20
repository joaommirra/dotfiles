local dap, dapui = require('dap'), require('dapui')
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

vim.keymap.set('n', '<F5>', ":lua require('dap').continue()<CR>")
vim.keymap.set('n', '<F10>', ":lua require('dap').step_over()<CR>")
vim.keymap.set('n', '<F11>', ":lua require('dap').step_into()<CR>")
vim.keymap.set('n', '<F12>', ":lua require('dap').step_out()<CR>")
vim.keymap.set('n', '<Leader>b', ":lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set('n', '<Leader>dl', ":lua require('dap').run_last()<CR>")
vim.keymap.set('n', '<Leader>dr', ":lua require('dap').repl.open()<CR>")

vim.keymap.set('n', '<F2>', ":lua require('dapui').toggle()<CR>")
vim.keymap.set('v', '<C-q>', ":lua require('dapui').eval()<CR>")

dap.adapters.python = {
  type = 'executable',
  command = os.getenv('HOME') .. '/.virtualenvs/tools/bin/python',
  args = { '-m', 'debugpy.adapter' },
}

require("nvim-dap-virtual-text").setup()

dapui.setup({
  icons = {
    expanded = '▾',
    collapsed = '▸',
  },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { '<CR>', '<2-LeftMouse>' },
    open = 'o',
    remove = 'd',
    edit = 'e',
  },
  sidebar = {
    open_on_start = true,
    elements = {
      -- You can change the order of elements in the sdebar
      'watches',
      'scopes',
      -- 'breakpoints',
      -- 'stacks',
    },
    width = 40,
    position = 'left', -- Can be 'left' or 'right'
  },
  tray = {
    open_on_start = true,
    elements = {
      'repl',
    },
    height = 10,
    position = 'bottom', -- Can be 'bottom' or 'top'
  },
})
