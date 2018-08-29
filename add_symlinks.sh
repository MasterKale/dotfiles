echo Linking .zshrc into '$HOME' \($HOME\)
rm $HOME/.zshrc
ln -sv "$(pwd)/.zshrc" $HOME
echo ✅ Done
