local plugin = {
  "mfussenegger/nvim-jdtls",
  ft = { "groovy", "java" },
  config = function()
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
    local workspace_dir = '/home/diego/.java-projects-workspace/' .. project_name
    os.execute("mkdir -p " .. workspace_dir) -- create the folder
    local config = {
      cmd = {
        "/home/diego/.sdkman/candidates/java/22.3.r17-grl/bin/java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", "/home/diego/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
        "-configuration", "/home/diego/.local/share/nvim/mason/packages/jdtls/config_linux",
        "-data", workspace_dir
      },
      root_dir = require('jdtls.setup').find_root({'mvnw', 'gradlew', "build.gradle", "pom.xml"})
    }
    require("jdtls").start_or_attach(config)
  end
}

return plugin