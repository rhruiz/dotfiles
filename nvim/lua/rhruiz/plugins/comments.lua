return {
  { 'numToStr/Comment.nvim', opts = {} },
  { 'folke/todo-comments.nvim', cond = not require("rhruiz.runtime").vscode, event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
