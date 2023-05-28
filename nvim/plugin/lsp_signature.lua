vim.keymap.set({ 'n' }, '<C-k>', function() require('lsp_signature').toggle_float_win()
end, { silent = true, noremap = true, desc = 'toggle signature' })

vim.keymap.set({ 'n' }, '<Leader>k', function()
  vim.lsp.buf.signature_help()

end, { silent = true, noremap = true, desc = 'toggle signature' })


local example_setup = {
  on_attach = function(client, bufnr)

    require "lsp_signature".on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded"
      }
    }, bufnr)

  end,

}
