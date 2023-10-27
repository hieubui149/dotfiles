require('dashboard').setup {
  theme = 'hyper',
  config = {
    week_header = {
     enable = true,
    },
    shortcut = {
      {
        desc = '⚡Update',
        group = '@property',
        action = 'Lazy update',
        key = 'u'
      },
      {
        icon_hl = '@variable',
        desc = ' Files',
        group = 'Label',
        action = 'NvimTreeToggle',
        key = 'q',
      },
      {
        icon_hl = '@variable',
        desc = ' Search',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        desc = ' New Buffer',
        group = 'Label',
        action = 'ene',
        key = 'n',
      },
      {
        desc = ' Git Status',
        group = 'Number',
        action = 'Telescope git_status',
        key = 'g',
      },
    },
  },
}
