# Backup the current nvim
mv ~/.config/nvim ~/.config/nvim.mine

mv ~/.local/share/nvim ~/.local/share/nvim.mine
mv ~/.local/state/nvim ~/.local/state/nvim.mine
mv ~/.cache/nvim ~/.cache/nvim.mine

# make Lazyvim the active nvim
mv ~/.config/nvim.lazyvim ~/.config/nvim

mv ~/.local/share/nvim.lazyvim ~/.local/share/nvim
mv ~/.local/state/nvim.lazyvim ~/.local/state/nvim
mv ~/.cache/nvim.lazyvim ~/.cache/nvim
