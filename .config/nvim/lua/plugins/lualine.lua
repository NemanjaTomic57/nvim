return{
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local lualine = require('lualine')
            local lazy_status = require('lazy.status')


            local mode = {
                'mode',
                fmt = function(str)
                    -- return ' '
                    -- displays only the first character of the mode
                    return ' ' .. str
                end,
            }


            local diff = {
                'diff',
                colored = true,
                symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
                -- cond = hide_in_width,
            }

            local filename = {
                'filename',
                file_status = true,
                path = 1,
            }

            local branch = {'branch', icon = {'', color={fg='#A6D4DE'}}, '|'}

            lualine.setup({
                icons_enabled = true,
                options = {
                    theme = 'horizon',
                    component_separators = { left = '|', right = '|' },
                    section_separators = { left = '|', right = '|' },
                },
                sections = {
                    lualine_a = { mode },
                    lualine_b = { branch },
                    lualine_c = { diff, filename },
                    lualine_x = {
                        {
                            -- require('noice').api.statusline.mode.get,
                            -- cond = require('noice').api.statusline.mode.has,
                            lazy_status.updates,
                            cond = lazy_status.has_updates,
                        },
                        { 'encoding' },
                        { 'fileformat' },
                        { 'filetype' },
                    },
                },
            })
        end
    }
}
