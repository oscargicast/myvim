# Requirements:
- ~/.vimrc
- Vundle
- Colorschemes

## vimrc
If cat ~/.vimrc produce nothing, type:

touch ~/.vimrc (replace with the .vimrc of this repo or copy his content)

## Vundle
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## Colorschemes
Objetive: put the folder **colors** inside **~/.vim/**. The mentioned folder contains many colorschemes, for example:
* solarized.vim
* Tomorrow-Night.vim (colorscheme to use in my vim)
```
git clone https://github.com/flazz/vim-colorschemes ~/.vim/

cd ~/.vim/vim-colorschemes/

mv colors/ ..

cd ..

rm -rf vim-colorschemes/
```

**Finally use vim and all the configurations will be installed**

Example
```
vim sample.txt
```
