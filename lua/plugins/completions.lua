
-- Auto complete
return {
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- Add snippets
			require("luasnip.loaders.from_vscode").lazy_load()

            -- TODO: figure out what the point of this is
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			cmp.setup({
				snippet = {
					-- Required
					expand = function(args)
						-- Use luasnip as the snippet engine
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					-- Window look
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					-- Basic mappings
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-v>"] = cmp.mapping.scroll_docs(4),
					["<C-y>"] = cmp.mapping.complete()(),
					["<C-a>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),

					-- LuaSnip mappings
					["<Tab>"] = cmp.mapping(function(fallback)
                        -- TODO: read through this and rewrite
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
                    { name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
				}),
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
    {
        "hrsh7th/cmp-nvim-lsp",
    },
}
