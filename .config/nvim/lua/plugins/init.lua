return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- { import = "nvchad.blink.lazyspec" },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc", "html", "css", "rust", "ron", "bash"
  		},
  	},
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
    ft = { "markdown" },
    config = function()
      require("render-markdown").setup({})
    end,
  },

  { import = "plugins.ron" },

  -- Rust Setup by grok
  {
    "mrcjkb/rustaceanvim",
    version = "^6",   -- 중요! 2025~2026년에는 v6계열이 안정적
    lazy = false,     -- NvChad에서는 false 추천 (lsp 즉시 로드)
    ft = { "rust", "toml" },

    dependencies = {
      "neovim/nvim-lspconfig",
      -- nvim-dap가 이미 있다면 굳이 안 넣어도 됨
    },

    -- 아주 중요한 부분
    config = function()
      vim.g.rustaceanvim = {
        -- 기본 설정으로도 충분히 잘 돌아감
        server = {
          -- cmd = { "rustup", "run", "nightly", "rust-analyzer" },  ← 필요시 nightly 사용
          settings = {
            -- rust-analyzer 설정 (선택)
            ["rust-analyzer"] = {
              check = {
                command = "clippy",           -- clippy로 linting (좋은 선택)
              },
              imports = {
                granularity = {
                  group = "module",
                },
                prefix = "self",
              },
              cargo = {
                buildScripts = {
                  enable = true,
                },
              },
              procMacro = {
                enable = true,
              },
              inlayHints = {
                lifetimeElisionHints = {
                  enable = "skip_trivial",
                },
                bindingModeHints = {
                  enable = true,
                },
              },
            },
          },
        },

        -- 디버깅 설정 (codelldb 사용 추천)
        dap = {
          adapter = false,  -- 기본적으로 nvim-dap + codelldb 자동 설정
        },

        -- 자동 포맷팅은 conform.nvim이 이미 하고 있을 테니 false
        tools = {
          autoSetHints = true,
        },
      }
    end,
  },

  -- toml 플러그인도 같이 넣으면 Cargo.toml 편집이 편해짐
  { "cespare/vim-toml", ft = "toml" },
}
