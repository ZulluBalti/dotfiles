lua require("telescope").setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}})

function Find_files()
    require('telescope.builtin').find_files({
        find_command = {'fd', '--type', 'f', '--no-ignore-vcs', '--color=never', '--hidden', '--follow'},
        prompt_prefix = '📄 '
    })
end

function Git_or_find_files()
    local results = require('telescope.utils').get_os_command_output({'git', 'rev-parse', '--git-dir'})

    if results[1] then
        require('telescope.builtin').git_files({ -- or new custom picker's attach_mappings field:
          c prompt_prefix = ' '
        })
    else
        Find_files()
    end
	end
end

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({	search = vim.fn.input("Grep for > ")})<CR>
nnoremap <C-p> :lua Git_or_find_files()<CR>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>


nnoremap <leader>pw :lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>")})<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
