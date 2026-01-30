lua << EOF
require('dap-go').setup()
require('dap').defaults.fallback.exception_breakpoints = {'raised'}
vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpoint', { 
  text = ' ●',
  texthl = 'DapBreakpoint', 
  linehl = '', 
  numhl = '' 
})
vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#E06C75', bold = true })

vim.fn.sign_define('DapStopped', { 
  text = ' ➔', 
  texthl = 'DapStopped' 
})
vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#98C379' })

local dap = require('dap')
local dap_view = require('dap-view')

dap_view.setup({ 
  winbar = {
    show = true, 
    default_section = "scopes",
  }
})

dap.listeners.after.event_initialized["dapui_config"] = function()
dap_view.open()
end

dap.configurations.go = {
  {
      type = "go",
      name = "Debug Project",
      request = "launch",
      program = function()
      local mod_file = vim.fs.find('go.mod', { upward = true, path = vim.fn.expand('%:p:h') })[1]
      if not mod_file then return vim.fn.expand('%:p:h') end
        local root = vim.fs.dirname(mod_file)

        local cmd = string.format('grep -rl "package main" %s --exclude-dir={vendor,.git}', root)
        local handle = io.popen(cmd)
        local result = handle:read("*a")
        handle:close()

        local locations = {}
        for s in result:gmatch("[^\r\n]+") do
          table.insert(locations, vim.fn.fnamemodify(s, ":h"))
          end

          if #locations > 0 then
            return (#locations == 1) and locations[1] or vim.fn.input('Path: ', locations[1], 'dir')
            end
            return root
            end,

            cwd = function()
            local mod_file = vim.fs.find('go.mod', { upward = true, path = vim.fn.expand('%:p:h') })[1]
            if mod_file then
              return vim.fs.dirname(mod_file)
              end
              return vim.fn.getcwd()
              end,
              exception_breakpoints = {},
              },
}

vim.keymap.set('n', '<F6>', dap.continue, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>v', dap_view.toggle, { desc = 'Debug: Toggle DAP View' })
EOF

let g:gotests_template_dir = '/home/diahex/gotests-templates/templates'
