return {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
			"",
			"",
			"",
			"",
	"	██    ██ ███████ ███████ ██   ██ ██    ██  █████  ",
	"	 ██  ██  ██      ██      ██   ██ ██    ██ ██   ██ ",
	"	  ████   █████   ███████ ███████ ██    ██ ███████ ",
	"	   ██    ██           ██ ██   ██ ██    ██ ██   ██", 
	"	   ██    ███████ ███████ ██   ██  ██████  ██   ██ 	",	
				"",
				"",
			"",
			"",
      }


	dashboard.section.buttons.val = {
	  dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
	  dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
	  dashboard.button("n", "  New File", ":ene <BAR> startinsert<CR>"),
	  dashboard.button("m", "  Mason", ":Mason<CR>"),
	  dashboard.button("u", "  Update Plugins", ":Lazy update<CR>"),
	  dashboard.button("q", "  Quit", ":qa<CR>"),
	     }


	-- Footer
      dashboard.section.footer.val = "🌀 Neovim - Config by Ze Fernando"

      -- Estilo opcional para footer
      dashboard.section.footer.opts.hl = "Comment"

      alpha.setup(dashboard.config)
    end,
  }
