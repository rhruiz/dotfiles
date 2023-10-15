vim.g.ruby_host_prog = '/usr/local/lib/ruby/gems/3.2.0/bin/neovim-ruby-host'

vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, { pattern = 'Gemfile', command = 'setf ruby' })
