local servers = { "jsonls", "sumneko_lua", "tsserver", "clangd", "pyright" }

local settings = {
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)

require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
	}
	server = vim.split(server, "@")[1]

	if server == "sumneko_lua" then
		local sumneko_opts = require("lsp.langsettings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server == "tsserver" then
		local tsserver_opts = require("lsp.langsettings.tsserver")
		opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	end

	if server == "clangd" then
		local tsserver_opts = require("lsp.langsettings.clangd")
		opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	end

	if server == "pyright" then
		local tsserver_opts = require("lsp.langsettings.pyright")
		opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	end

	lspconfig[server].setup(opts)
end
