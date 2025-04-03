local cmp = require("cmp")
local luasnip = require("luasnip")
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
    		['<C-f>'] = cmp.mapping.scroll_docs(4),
    		['<C-Space>'] = cmp.mapping.complete(),
    		['<C-e>'] = cmp.mapping.abort(),
    		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
    		['<Tab>'] = cmp.mapping(function(fallback)
      		if cmp.visible() then
        		cmp.select_next_item()
      		elseif luasnip.expand_or_jumpable() then
        		luasnip.expand_or_jump()
      		else
        		fallback()
      		end
    	end, { 'i', 's' }),
    	['<S-Tab>'] = cmp.mapping(function(fallback)
      		if cmp.visible() then
        		cmp.select_prev_item()
      		elseif luasnip.jumpable(-1) then
        		luasnip.jump(-1)
      		else
        		fallback()
      		end
    	end, { 'i', 's' }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path"},
	}),
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the git source
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (search command-line mode)
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use path and cmdline source for `:` (command-line mode)
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").clangd.setup { capabilities = capabilities }
require("lspconfig").cmake.setup { capabilities = capabilities }
require("lspconfig").lua_ls.setup { capabilities = capabilities }
require("lspconfig").pyright.setup { capabilities = capabilities }
require("lspconfig").asm_lsp.setup {capabilities = capabilities}
