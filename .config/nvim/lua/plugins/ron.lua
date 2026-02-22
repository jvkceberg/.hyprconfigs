return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- NvChad v2.5에서는 경로가 'nvchad'로 시작해야 합니다.
      require("nvchad.configs.lspconfig").defaults()

      local lspconfig = require "lspconfig"
      local configs = require "lspconfig.configs"

      -- ron_lsp 커스텀 설정 등록
      if not configs.ron_lsp then
        configs.ron_lsp = {
          default_config = {
            cmd = { "ron-lsp" },
            filetypes = { "ron" },
            root_dir = lspconfig.util.root_pattern("Cargo.toml", ".git") or vim.loop.cwd(),
          },
        }
      end

      -- NvChad의 표준 설정(on_attach, capabilities 등) 가져오기
      local on_attach = require("nvchad.configs.lspconfig").on_attach
      local on_init = require("nvchad.configs.lspconfig").on_init
      local capabilities = require("nvchad.configs.lspconfig").capabilities

      -- ron_lsp 실행
      lspconfig.ron_lsp.setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
      }
    end,
  },
}
