local fzfLua = require("fzf-lua")
vim.keymap.set("n", "<c-P>", fzfLua.git_files, { desc = "fzf git files" })
vim.keymap.set("n", "<c-L>", function() fzfLua.live_grep({ cmd = "git grep --line-number --column --color=always" }) end, { desc = "fzf git grep" })
