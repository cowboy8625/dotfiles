sudo add-apt-repository ppa:appimagelauncher-team/stable &&
sudo apt update && sudo apt upgrade && sudo apt install &&
appimagelauncher \
python3 \
ipython3 \
rtv \
htop \
neofetch \
nitrogen \
#neovim \
build-essential \
discord \
nodejs \
tmate \
tmux \
cmake \
gdb \
ffmpeg \
mpv \
lua5.3 \
figlet \
toilet \
w3m \
arduino \
dosbox \
flameshot \
vifm \
irssi \
newsboat \
sxiv \
cmus && \
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh &&
cargo install rusty-rain &&
git clone https://github.com/cowboy8625/dotfiles.git &&
python -m pip install pynvim --user &&
cd ~/Documents && git clone https://github.com/ryanoasis/nerd-fonts.git &&
cd nerd-fonts && ./installed.sh;
