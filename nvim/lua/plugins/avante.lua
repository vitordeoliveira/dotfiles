return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    -- add any opts here
    -- for example
    provider = "claude",
    system_prompt = function()
      local hub = require("mcphub").get_hub_instance()
      return hub and hub:get_active_servers_prompt() or ""
    end,
    -- Using function prevents requiring mcphub before it's loaded
    custom_tools = function()
      return {
        require("mcphub.extensions.avante").mcp_tool(),
      }
    end,
    --     system_prompt = [[Your name is Claudio, As an AI assistant, your primary focus is to gather all necessary information before starting any coding task.
    --     Always ask concise and direct questions to clarify the task requirements.
    --     Avoid unnecessary or flowery language.
    --     Make extensive questions before coding, and always summarize what you will do before doing.
    --     Your goal is to ensure complete understanding of the task before proceeding with any coding.
    --     Here are some guidelines:
    --
    -- 1. **Ask Concise and Direct Questions:**
    --    - Focus on understanding the task requirements clearly.
    --    - Avoid unnecessary or flowery language to maintain clarity.
    --
    -- 2. **Make Extensive Inquiries:**
    --    - Gather all necessary information before starting any coding.
    --    - Ensure no aspect of the task is overlooked by asking comprehensive questions.
    --
    -- 3. **Summarize Before Action:**
    --    - Clearly outline what you plan to do before proceeding with any coding.
    --    - Ensure that the summary reflects a complete understanding of the task.
    --
    -- 4. **Ensure Complete Understanding:**
    --    - Verify that all aspects of the task are understood before beginning.
    --    - Address any uncertainties or ambiguities through further questioning.
    --
    -- These guidelines aim to ensure a thorough and clear approach to understanding and executing tasks.]],
    openai = {
      endpoint = "https://api.openai.com/v1",
      model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
      timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
      temperature = 0,
      max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
      --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
    },

    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-3-7-sonnet-20250219",
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  disabled_tools = {
    "list_files", -- Built-in file operations
    "search_files",
    "read_file",
    "create_file",
    "rename_file",
    "delete_file",
    "create_dir",
    "rename_dir",
    "delete_dir",
    "bash", -- Built-in terminal access
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
