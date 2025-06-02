_shell_flags="$-"
if [ "$DEBUG_SHELL" = '1' ]; then
#   _file=$1
#   _file="${_file#$HOME}" # don't fully expand ~
#   _file="~$_file"
#   case "$_shell_flags" in
#       *i*) 
#          echo "$(debug_sep_)${_file}-> 0"
#          return 0 ;;
#       *)
#          echo "$(debug_sep_)${_file}-> 1"
#          return 1 ;;
#   esac
#else
#   case "$_shell_flags" in
#       *i*) 
#          return 0;;
#       *)
#          return 1 ;;
#   esac
#fi
   case "$_shell_flags" in
      *i*) 
         return 0 ;;
      *)
         return 1 ;;
   esac
fi
