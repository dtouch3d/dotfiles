dotfiles
========

My configuration dotfiles.

I use the very convenient GNU Stow for my configuration management. All the dotfiles reside in their corresponding folders in ~/dotfiles and a simple

    cd dotfiles
    stow bash

symbolically links the files in $HOME.

Courtesy of http://taihen.org/managing-dotfiles-with-gnu-stow/
