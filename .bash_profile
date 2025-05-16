# .bash_profile

# nix configuration
# As per AID/4403
#
#if [[ $- == *i* ]]; then  # check if interactive shell
#   if [ -x "$HOME/bin/nix-enter" ]; then
#      if [ ! -e /nix/var/nix/profiles ] || [ -z ${NIX_ENTER} ]; then
#         export NIX_ENTER="TRUE"
#         exec "$HOME/bin/nix-enter"
#      fi
#   fi
#fi

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export TZ=Europe/Dublin
EDITOR=vim
export EDITOR
VISUAL=$EDITOR
export VISUAL
# End add

PATH=$PATH:$HOME/.local/bin:$HOME/bi
CDPATH=".:/src"

export PATH
export CDPATH
. "$HOME/.cargo/env"
#
#if [ -e /home/andrewwhelan/.nix-profile/etc/profile.d/nix.sh ]; then . /home/andrewwhelan/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
