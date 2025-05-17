vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })


-- saving and quitting
keymap.set("n", "<leader>w", "<cmd>update<CR>", { desc = "Save", noremap = true, silent = true })
keymap.set("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit", noremap = true, silent = true })
keymap.set("n", "<leader>Q", "<cmd>qa<CR>", { desc = "Quit all", noremap = true, silent = true })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>s<", "<C-w><", { desc = "Resize Window <<" })
keymap.set("n", "<leader>s>", "<C-w>>", { desc = "Resize Window >>" })


keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<tab>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<s-tab>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })


-- trouble
-- Lua
-- keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
-- keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
-- keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
-- keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
-- keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
-- keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
--

-- zenmode
keymap.set("n", "<leader>zm", "<cmd>ZenMode<CR>", { desc = "Zen mode" })

-- obsidian
-- navigate to vault
keymap.set("n", "<leader>oo", ":cd ~/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Obsidian<cr>")

-- convert note to template and remove leading white space
keymap.set("n", "<leader>on", ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")
-- strip date from note title and replace dashes with spaces
-- must have cursor on title
keymap.set("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>")
--
-- search for files in full vault
keymap.set("n", "<leader>os", ":Telescope find_files search_dirs={\"~/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Obsidian\"}<cr>", { desc = "Search for Obsidian Files in Vault" })
keymap.set("n", "<leader>oz", ":Telescope live_grep search_dirs={\"~/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Obsidian\"}<cr>", { desc = "Search Obsidian Notes" })
--

-- neotest
keymap.set("n", ";tt", function() require('neotest').run.run() end, { desc = "Run nearest test" })
keymap.set("n", ";tf", function() require('neotest').run.file() end, { desc = "Run current file tests" })
keymap.set("n", "<leader>us", function() require('neotest').run.suite() end, { desc = "Run test suite" })
keymap.set("n", "<leader>uc", function() require('neotest').run.coverage() end, { desc = "Run test coverage" })
keymap.set("n", ";tw", function() 
    local nt = require('neotest')
    nt.summary.toggle()
    nt.watch.watch({suite = true })
end, { desc = "Open test summary" })

-- peek
keymap.set("n", "<leader>po", function() require("peek").open() end, { desc = "Peek Open" })
keymap.set("n", "<leader>pc", function() require("peek").close() end, { desc = "Peek Close" })

