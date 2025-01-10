vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
-- vim.opt.numberwidth = 6
vim.opt.termguicolors = true
-- show more pretty diff
-- vim.opt.fillchars = vim.opt.fillchars + "diff:."
-- use system clipboard
vim.opt.clipboard = "unnamedplus"
-- complete options
vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.updatetime = 100

-- terminal at the bottom  - copy paste from https://github.com/linkarzu/dotfiles-latest
local M = {}
M.tmux_pane_function = function(dir)
	-- NOTE: variable that controls the auto-cd behavior
	local auto_cd_to_new_dir = true
	-- NOTE: Variable to control pane direction: 'right' or 'bottom'
	-- If you modify this, make sure to also modify TMUX_PANE_DIRECTION in the
	-- zsh-vi-mode section on the .zshrc file
	-- Also modify this in your tmux.conf file if you want it to work when in tmux
	-- copy-mode
	local pane_direction = vim.g.tmux_pane_direction or "bottom"
	-- NOTE: Below, the first number is the size of the pane if split horizontally,
	-- the 2nd number is the size of the pane if split vertically
	local pane_size = (pane_direction == "right") and 60 or 20
	local move_key = (pane_direction == "right") and "C-l" or "C-k"
	local split_cmd = (pane_direction == "right") and "-h" or "-v"
	-- if no dir is passed, use the current file's directory
	local file_dir = dir or vim.fn.expand("%:p:h")
	-- Simplified this, was checking if a pane existed
	local has_panes = vim.fn.system("tmux list-panes | wc -l"):gsub("%s+", "") ~= "1"
	-- Check if the current pane is zoomed (maximized)
	local is_zoomed = vim.fn.system("tmux display-message -p '#{window_zoomed_flag}'"):gsub("%s+", "") == "1"
	-- Escape the directory path for shell
	local escaped_dir = file_dir:gsub("'", "'\\''")
	-- If any additional pane exists
	if has_panes then
		if is_zoomed then
			-- Compare the stored pane directory with the current file directory
			if auto_cd_to_new_dir and vim.g.tmux_pane_dir ~= escaped_dir then
				-- If different, cd into the new dir
				vim.fn.system("tmux send-keys -t :.+ 'cd \"" .. escaped_dir .. "\"' Enter")
				-- Update the stored directory to the new one
				vim.g.tmux_pane_dir = escaped_dir
			end
			-- If zoomed, unzoom and switch to the correct pane
			vim.fn.system("tmux resize-pane -Z")
			vim.fn.system("tmux select-pane -D") --send-keys " .. move_key)
		else
			-- If not zoomed, zoom current pane
			vim.fn.system("tmux resize-pane -Z")
		end
	else
		-- Store the initial directory in a Neovim variable
		if vim.g.tmux_pane_dir == nil then
			vim.g.tmux_pane_dir = escaped_dir
		end
		-- If no pane exists, open it with zsh and DISABLE_PULL variable
		vim.fn.system(
			"tmux split-window "
				.. split_cmd
				.. " -l "
				.. pane_size
				.. " 'cd \""
				.. escaped_dir
				.. "\" && DISABLE_PULL=1 fish'"
		)
		vim.fn.system("tmux send-keys " .. move_key)
		-- Resolve zsh-vi-mode issue for first-time pane
		-- vim.fn.system("tmux send-keys Escape i")
	end
end
-- If I execute the function without an argument, it will open the dir where the
-- current file lives
vim.keymap.set({ "n", "v", "i" }, "<M-t>", function()
	M.tmux_pane_function()
end, { desc = "[P]Terminal on tmux pane on the right" })

vim.filetype.add({
	extension = {
		tpl = "gotmpl",
	},
})
