dotfiles
========

My personnal dotfiles.


### Installation

    git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
    source "$HOME/.homesick/repos/homeshick/homeshick.sh
    alias homeshick source "$HOME/.homesick/repos/homeshick/bin/homeshick.sh"
    
    homeshick clone Pamplemousse/dotfiles


### Add a file

    homeshick track dotfiles /path_to/file_to_be_tracked
    homeshick cd dotfiles
    git commit -a -m "awesome commit message"
    git push origin master
    
    
### Updating a computer's config

    homeshick cd dotfiles
    git pull origin master
    homeshick link


### Help and documentation

  - installation : https://github.com/andsens/homeshick/wiki/Installation
  - tutorials    : https://github.com/andsens/homeshick/wiki/Tutorials
