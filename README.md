# dotfiles

Config files to maintain UX across devices, and setup scripts to simplify initial setup of new machines. What's not to love?

## Instructions

1. Clone this repo into **~**:

```sh
$> cd ~
$> git clone https://github.com/MasterKale/dotfiles
```
2. Navigate to the **~/dotfiles/** folder:

```sh
$> cd ~/dotfiles
```

2. Run whatever **setup_[os-here].sh** script is appropriate for the OS being configured.

## Manually linking individual dotfiles

If it's preferable to manually move a dotfile into place, opt for a **symbolic link** instead of a copy->paste.

For example, to move the **.zshrc** file into its rightful place in **~**, run the following:

```sh
$> ln -sv "$HOME/dotfiles/.zshrc" $HOME
```

Alternatively, you can run **add_symlinks.sh** to automate things:

```sh
$> source add_symlinks.sh
```

## Miscellaneous Notes

### Benchmarking ZSH/Bash/etc... startup times

I was troubleshooting some slowness in ZSH startup when I came across this handy command:

```sh
$> for i in $(seq 1 10); do /usr/bin/time $SHELL -i -c exit; done
```

This command will log the amount of time it takes to initialize the shell 10 times:

```
0.29 real         0.16 user         0.11 sys
0.28 real         0.16 user         0.10 sys
0.28 real         0.16 user         0.10 sys
0.28 real         0.16 user         0.10 sys
0.32 real         0.17 user         0.11 sys
0.30 real         0.17 user         0.11 sys
0.28 real         0.16 user         0.10 sys
0.28 real         0.16 user         0.10 sys
0.28 real         0.16 user         0.10 sys
0.29 real         0.16 user         0.10 sys
```
