# Linux configuration DotFiles

## TL;DR

This repository consists of my personal dotfiles used for
configuration of applications like the `starship` prompt,
`neovim` and `bash`/`zsh`.

## Installation

```bash
cd $HOME && \
git clone git@github.com/smc181002/dotfiles.git
```

## Commands used

The files in dotfiles repo are symbolic links for the 
actual files at different locations in the home of the 
user.

### Install Kitty

```bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

the configuration files for kitty are stored in 
`.config/kitty/` directory

### Install ZSH 

We can install ZSH in most of the distributions. Below is a
guide about how to install referenced from 
[Oh My Zsh Wiki](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#install-and-set-up-zsh-as-default)

**Installating**

**Ubuntu, Debian & derivatives (Windows 10 WSL | Native 
Linux kernel with Windows 10 build 1903)**

```bash
sudo apt install zsh
```

Other distributions that apply include: Linux Mint, 
elementary OS, Zorin OS, Raspbian, MX Linux, Deepin.

**OpenSUSE**
```bash 
sudo zypper install zsh
```

**Arch Linux or Manjaro**

```bash 
sudo pacman -S zsh
```

**Fedora**

```bash
dnf install zsh
```

**Centos/RHEL**
```bash
sudo yum update && sudo yum -y install zsh
```

**Setup**

chsh -s $(which zsh)

the configuration file for zsh is stored in `.zshrc` 
directory.

### starship

To install starship prompt, 
[Click Here](https://starship.rs/guide/#%F0%9F%9A%80-installation) 

```bash
# ~/.config/starship.toml

cd ~/dotfiles
mkdir -p .config
ln -s ~/.config/starship.toml .config
```

### Fonts

Starship uses Glyphs which requires a nerd font and here is
a font called **Menlo Extra** (extension of Menlo font).
[Click Here](https://github.com/yumitsu/font-menlo-extra)
to install the font files.

### Neovim

**Installation**

**OpenSUSE**
Neovim can be installed with:

```bash
sudo zypper in neovim
```

To install the Python modules:

```bash
sudo zypper in python-neovim python3-neovim
```

**Fedora**

Neovim is in Fedora starting with Fedora 25:

```bash
sudo dnf install -y neovim python3-neovim
```

**Debian**

```bash
sudo apt-get update
sudo apt-get install neovim
```

**CentOS 8 / RHEL 8**
Neovim is available through EPEL (Extra Packages for 
Enterprise Linux)

```bash
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
yum install -y neovim python3-neovim
```

**Arch Linux**

```bash
sudo pacman -S neovim python-pynvim
```

**Any other Linux**

AppImage ("universal" Linux package)
The Releases page provides an AppImage that runs on most 
Linux systems. No installation is needed, just download 
`nvim.appimage` and run it. (It might not work if your 
Linux distribution is more than 4 years old.)

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
```


If the ./nvim.appimage command fails, try:

```bash
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

# Optional: exposing nvim globally.
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
nvim
```

**setup**

Load the `nvim` directory in `~/.config/`
