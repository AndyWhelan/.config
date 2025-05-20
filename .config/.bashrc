# bash non-login-shell setup. NO 'heavyweight', or common stuff here, i.e.
# 1. No environment variables,
# 2. No resource-intensive commands,
# 3. No time-intensive scripts, and 
# 4. No background services/processes
# 5. Nothing that isn't unique to bash (source from common file below)

# Source system-wide bashrc
if [[ "$OSTYPE" != "darwin"* ]]; then  # not on Mac, so ok to source
   if [ -f /etc/bashrc ]; then
           . /etc/bashrc
   fi
fi
# Source bash login-shell configs
if [ -f ~/.bash_profile ]; then
        . $HOME/.bash_profile
fi
# Source common non-login-shell configs
if [ -f ~/.common_rc ]; then
        . $HOME/.common_rc
fi
