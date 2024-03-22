return {
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      -- figlet font "The Edge"
      local logo = [[
 ___                    _         _ _____ _   _ 
|   \ _ __  __ _ _ _ __| |_  __ _| |_   _| | | |
| |) | '  \/ _` | '_(_-< ' \/ _` | | | | | |_| |
|___/|_|_|_\__,_|_| /__/_||_\__,_|_| |_|  \___/ 
]]

      logo = string.rep("\n", 6) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
