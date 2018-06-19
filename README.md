# dotfiles


My personnal dotfiles.


## Tests

Nice to guarantee in particular that some aliases will keep working.

```
./tests/bash_unit tests/test_*.sh
```


## Usage

### Installation

```
git clone git://github.com/andsens/homeshick.git "$HOME/.homesick/repos/homeshick"
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
homeshick clone Pamplemousse/dotfiles
```


### Add a file

```
homeshick track dotfiles /path_to/file_to_be_tracked
homeshick cd dotfiles
git commit -a -m "awesome commit message"
git push origin master
```


### Updating a computer's config

```
homeshick cd dotfiles
git pull origin master
homeshick link
```


### Help and documentation

  * [installation](https://github.com/andsens/homeshick/wiki/Installation)
  * [tutorials](https://github.com/andsens/homeshick/wiki/Tutorials)
