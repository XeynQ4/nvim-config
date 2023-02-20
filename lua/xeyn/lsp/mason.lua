local servers = {
	"lua_ls",
	"pyright",
	"jsonls",
	"tsserver",
	"cssls",
	"marksman",
}

require("mason").setup {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig = require("lspconfig")

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("xeyn.lsp.handlers").on_attach,
		capabilities = require("xeyn.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "xeyn.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
