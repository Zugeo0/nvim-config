-- Mason, Mason-lspconfig and Lspconfig for lsp support
return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"gopls",
					"pyright",
                    "omnisharp",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason.nvim" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- Setup language servers
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.tsserver.setup({ capabilities = capabilities })
			lspconfig.gopls.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
            lspconfig.omnisharp.setup({ 
                capabilities = capabilities,
                cmd = { vim.env.MASON .. "/bin/omnisharp" },
            })

			-- Keymaps

			-- Gotos
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})

			-- Info
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {})

			-- Actions
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, {})

			-- Workspace
			vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, {})
			vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, {})
			vim.keymap.set("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, {})
		end,
	},
}
