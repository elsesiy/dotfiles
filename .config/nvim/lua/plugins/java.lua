local capabilities = require("nvchad.configs.lspconfig").capabilities

return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
      local mason_dir = vim.fn.stdpath("data") .. "/mason"
      local jdtls_install_dir = mason_dir .. "/packages/jdtls"
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local workspace_dir = vim.fn.expand("~/.local/share/jdtls-workspace/") .. project_name

      local config = {
        capabilities = capabilities,
        -- The command that starts the language server
        -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-Xmx2g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          "-jar",
          vim.fn.glob(jdtls_install_dir .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
          "-configuration",
          jdtls_install_dir .. "/config_mac",
          "-data",
          workspace_dir,
        },

        root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),
        settings = {
          java = {},
          signatureHelp = { enabled = true },
          completion = {
            favoriteStaticMembers = {
              "org.hamcrest.MatcherAssert.assertThat",
              "org.hamcrest.Matchers.*",
              "org.hamcrest.CoreMatchers.*",
              "org.junit.jupiter.api.Assertions.*",
              "java.util.Objects.requireNonNull",
              "java.util.Objects.requireNonNullElse",
              "org.mockito.Mockito.*",
            },
            filteredTypes = {
              "com.sun.*",
              "io.micrometer.shaded.*",
              "java.awt.*",
              "jdk.*",
              "sun.*",
            },
          },
        },

        -- Language server `initializationOptions`
        -- You need to extend the `bundles` with paths to jar files
        -- if you want to use additional eclipse.jdt.ls plugins.
        --
        -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
        --
        -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
        init_options = {
          bundles = {
            vim.fn.glob(
              mason_dir .. "/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
            ),
            vim.fn.glob(mason_dir .. "/packages/java-test/extension/server/*.jar"),
          },
        },
      }
      require("jdtls").start_or_attach(config)
    end,
  },
}
