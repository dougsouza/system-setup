# ------- Built for Ubuntu 20.04 Focal -------

# get root for required installs
export CURRENT_USER=$USER
sudo --preserve-env=CURRENT_USER su --preserve-environment

# ------- apt installs -------
apt update && apt upgrade

add-apt-repository -y ppa:git-core/ppa  # latest git
add-apt-repository -y ppa:libratbag-piper/piper-libratbag-git
apt update

apt install -y aria2
apt install -y bmon  # network speedometer
aot install -y build-essential
apt install -y curl
apt install -y exfat-utils exfat-fuse  # exfat filesystem stuff
apt install -y fonts-powerline
apt install -y git
apt install -y gparted  # disk partitioner
apt install -y piper # mouse settings
apt install -y terminator  # better terminal app
apt install -y unrar  # support for .rar archives
apt install -y wget
apt install -y zsh
echo $(which zsh) >> /etc/shells # add zsh to shell list
chsh -s $(which zsh) # set zsh as default shell

# ------- snap installs -------
snap install ffmpeg
snap install htop
snap install --classic code
snap install --classic slack
snap install spotify
snap install vlc

# ------- fixes that require root -------

# fix media keys delays
# see: https://askubuntu.com/questions/906723/fn-media-keys-slow-delayed-on-ubuntu-gnome-17-04
cat /usr/share/X11/xkb/symbols/br | sed -i -e 's/    modifier_map Mod3   { Scroll_Lock };/    \/\/ modifier_map Mod3   { Scroll_Lock };/'
# prepare dir for latex
mkdir -p /usr/local/texlive
chown $CURRENT_USER /usr/local/texlive # to avoid installing latex with sudo
exit # leave root user

# ------- manual installs -------

# install oh my zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install Anaconda
aria2c --max-connection-per-server 8 --dir ~/Downloads --out Anaconda3.sh https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh
sh ~/Downloads/Anaconda3.sh -b -p $HOME/anaconda3
rm ~/Downloads/Anaconda3.sh
~/anaconda3/bin/conda init
~/anaconda3/bin/conda init zsh

# install latex

# .zshrc setup
echo 'ZSH_THEME="bira"' >> ~/.zshrc

# code extensions
code --install-extension pkief.material-icon-theme
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-toolsai.jupyter


# ------- Other stuff -------
# latest git-annex
wget -O- http://neuro.debian.net/lists/focal.us-nh.libre | sudo tee /etc/apt/sources.list.d/neurodebian.sources.list
apt-key adv --recv-keys --keyserver hkp://pool.sks-keyservers.net:80 0xA5D32F012649A5A9
apt install -y git-annex



