return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim"
    },
    config = function()
        local is_open = false
        vim.keymap.set('n', '<C-e>', function()
            local neo_tree = require("neo-tree.sources.manager")
            if is_open then
                vim.cmd('Neotree close')
            else
                vim.cmd('Neotree filesystem reveal_force_cwd right')
            end
            is_open = not is_open
        end, {noremap = true, silent = true})
			vim.keymap.set('n', '<C-f>', ':Neotree focus<CR>', {})	
	end
}
