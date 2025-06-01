# Shell context: ( log, sc=user )
# Sourced by ( log, sc=user ), e.g. .bash_profile, .zprofile

# Terminology:
# {{{
# If a field is unset in the context tuple, assume it is unspecified and may vary
#       i[nteractive] (bool)    `[ -n "$PS1" ] && echo 1 || echo 0`
#       k[ernel]                `uname -s | tr '[:upper:]' '[:lower:]'`
#       log[in-shell] (bool)    `case "$0" in -*) echo 1 ;; *) echo 0 ;; esac`
#       par[ent process]        `ps -o comm= -p $(ps -o ppid= -p $$)`
#       sc[ope]                 { sys[tem], user }
#       sh[elltype]             { b[ash], z[sh], k[sh], ... }
# }}}

# Script-variables
#  {{{
darwin_dynamic_profiles="$HOME/Library/Application Support/iTerm2/DynamicProfiles"
functions_folder="$HOME/.config/shells/functions"
scripts_folder="$HOME/.config/shells/scripts"
#  }}}

# Helpers
. "$functions_folder/source_with_debug.sh" # TODO: add checks later

source_with_debug "$HOME/.shell_env" 'posix_profile' 'posix_env'
source_with_debug "$HOME/.shell_path" 'posix_profile' 'posix_path'
# Guards
. "$scripts_folder/interactive_guard" 'cp' # don't run if non-interactive shell
# double-sourcing guard (commented-out) {{{
#[ -n "$COMMON_PROFILE_SOURCED" ] && return 0 # no need to source again
#COMMON_PROFILE_SOURCED=1
#  }}}

# Environment
case "$OSTYPE" in
   darwin*) export ITERM2_DYNAMIC_PROFILES="$darwin_dynamic_profiles" ;;
esac
