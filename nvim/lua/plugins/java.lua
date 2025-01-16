-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
return {
	"mfussenegger/nvim-jdtls",
	name = "java",
	config = function(_, _)
		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
		local workspace_dir = "/opt/jdtls/workspace/" .. project_name

		local config = {
			cmd = {
				"/home/dieg0407/.sdkman/candidates/java/17.0.13-tem/bin/java", -- or '/path/to/java17_or_newer/bin/java'
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-Xmx1g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",

				-- 💀
				"-jar",
				"/opt/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar",

				-- 💀
				"-configuration",
				"/opt/jdtls/config_linux",

				-- 💀
				-- See `data directory configuration` section in the README
				"-data",
				workspace_dir,
			},
			root_dir = vim.fs.root(0, { "mvnw", "gradlew" }),
			settings = {
				java = {
					configuration = {
						runtimes = {
							{
								name = "JavaSE-21",
								path = "/home/dieg0407/.sdkman/candidates/java/21.0.5-tem",
							},
							{
								name = "JavaSE-17",
								path = "/home/dieg0407/.sdkman/candidates/java/17.0.13-tem",
							},
						},
					},
				},
			},
			init_options = {
				bundles = {},
			},
		}

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "java",
			callback = function()
				local jdtls = require("jdtls")
				jdtls.start_or_attach(config)
				vim.keymap.set("n", "<leader>up", jdtls.update_project_config, { desc = "Java: [U]pdate [P]roject" })
				vim.keymap.set("n", "<leader>oi", jdtls.organize_imports, { desc = "Java: [O]rganize [I]mports" })
			end,
		})
	end,
}
