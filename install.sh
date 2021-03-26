# ------- Built for Ubuntu 20.04 Focal -------

# get root for required installs
sudo su --preserve-environment

# ------- apt installs -------
apt update && apt upgrade

wget -O- http://neuro.debian.net/lists/focal.us-nh.libre | sudo tee /etc/apt/sources.list.d/neurodebian.sources.list
apt-key adv --recv-keys --keyserver hkp://pool.sks-keyservers.net:80 0xA5D32F012649A5A9
add-apt-repository -y ppa:git-core/ppa  # latest git
add-apt-repository -y ppa:libratbag-piper/piper-libratbag-git
apt update

apt install -y aria2
apt install -y bmon  # network speedometer
aot install -y build-essential
apt install -y curl
apt install -y exfat-utils exfat-fuse  # exfat filesystem stuff
apt install -y git
apt install -y git-annex
apt install -y gparted  # disk partitioner
apt install -y piper # mouse settings
apt install -y terminator  # better terminal app
apt install -y unrar  # support for .rar archives
apt install -y wget
# prepare dir for latex
mkdir -p /usr/local/texlive
exit # leave root user

# ------- snap installs -------
sudo snap install --classic code
sudo snap install --classic slack
sudo snap install spotify
sudo snap install vlc

# ------- manual installs -------
# setup zsh
apt install zsh
echo $(which zsh) >> /etc/shells
chsh -s $(which zsh)
# install oh my zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install Anaconda
aria2c --max-connection-per-server 8 --dir ~/Downloads https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh
bash ~/Downloads/Anaconda3-2020.11-Linux-x86_64.sh -b -p $HOME/anaconda3
rm ~/Downloads/Anaconda3-2020.11-Linux-x86_64.sh
~/anaconda3/bin/conda init zsh


# .zshrc setup
echo 'ZSH_THEME="bira"' >> ~/.zshrc

# code extensions
code --install-extension PKief.material-icon-theme
