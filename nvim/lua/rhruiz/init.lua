inUtterDarkness = function()
    return vim.fn.has("termguicolors") and
    vim.env.TERM_PROGRAM ~= "Apple_Terminal" and
    vim.env.ITERM_PROFILE ~= "Spacemacs light"
end

require("rhruiz/packer")
require("rhruiz/settings")
require("rhruiz/remap")
require("rhruiz/ruby")
