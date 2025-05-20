# zsh non-login-shell setup. NO 'heavyweight', or common stuff here, i.e.
# 1. No environment variables,
# 2. No resource-intensive commands,
# 3. No time-intensive scripts, and 
# 4. No background services/processes
# 5. Nothing that isn't unique to zsh (source from common file below)

# Source global definitions#
if [ -f /etc/zshrc ]; then
	. /etc/zshrc
fi
# Source zsh login-shell configs
if [ -f $HOME/.zprofile ]; then
	. $HOME/.zprofile
fi
# Source common non-login-shell configs
if [ -f $HOME/.common_rc ]; then
	. $HOME/.common_rc
fi
