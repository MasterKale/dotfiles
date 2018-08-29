# dotfiles

Config files to maintain UX across devices, and setup scripts to simplify initial setup of new machines. What's not to love?

## Instructions

1. Clone this repo into **~**:

```sh
$> cd ~
$> git clone https://github.com/MasterKale/dotfiles
```

2. Run whatever setup_%OS%.sh script is appropriate for the OS being configured

## Manually linking individual dotfiles

If it's preferable to manually move a dotfile into place, opt for a **symbolic link** instead of a copy->paste.

For example, to move the **.profile** file into its rightful place in **~**, run the following:

```sh
$> ln -sv "$HOME/dotfiles/.profile" $HOME
```
