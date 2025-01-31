return {
    'chipsenkbeil/distant.nvim', 
    branch = 'v0.3',
    config = function()
		require('distant'):setup({
  ['*'] = {
    cwd_on_connect = true, -- Change automatiquement le répertoire lors de la connexion
    default_methods = { 'ssh' }, -- Facultatif : méthode par défaut pour les connexions
  },
})
    end
}
