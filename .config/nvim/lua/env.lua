local M = {}

local is_work = vim.env.USER == "jelsesiy"

M.ai_model = function()
  if is_work then
    return "claude-sonnet-4"
  else
    return "claude-3.5-sonnet"
  end
end

M.mason_pkgs = function()
  local common_pkgs = {
    -- dap
    "delve",
    "java-debug-adapter",
    "java-test",

    -- lsp
    "bash-language-server",
    "gopls",
    "jdtls",
    "lua-language-server",
    "ruff",
    "yaml-language-server",

    -- formatting
    "gofumpt",
    "goimports",
    "google-java-format",
    "shfmt",
    "stylua",
    "yamlfix",

    -- lint
    "golangci-lint",
    "hadolint",
    "shellcheck",
    "sqlfluff",
    "yamllint",

    -- spelling
    "codespell",
  }

  local priv_pkgs = {
    "nil",
    "zls",
  }

  local work_pkgs = {
    "terraformls",
    "tflint",
    "tfsec",
  }

  if is_work then
    vim.list_extend(common_pkgs, work_pkgs)
    return common_pkgs
  else
    vim.list_extend(common_pkgs, priv_pkgs)
    return common_pkgs
  end
end

M.linters = function()
  local common = {
    dockerfile = { "hadolint" },
    go = { "golangcilint" },
    sh = { "shellcheck" },
    sql = { "sqlfluff" },
    yaml = { "yamllint" },
  }

  if is_work then
    local terraform = { "tflint", "tfsec" }
    table.insert(common, terraform)
  end

  return common
end

M.lsp_servers = function()
  local common = {
    "bashls",
    "dockerls",
    "docker_compose_language_service",
    "ruff",

    -- "jdtls" # managed via nvim-jdtls ft
    -- "rust_analyzer" # managed via rustaceanvim
  }

  if is_work then
    table.insert(common, "terraformls")
  else
    table.insert(common, "zls")
  end

  return common
end

return M
