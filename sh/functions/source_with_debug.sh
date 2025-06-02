[ -z "$debug_sep" ] && debug_sep=' '
[ -z "$debug_indent" ] && debug_indent=0
[ -z "$debug_connector" ] && debug_connector=' -> '
[ -z "$debug_indent_offset" ] && debug_indent_offset=${#debug_connector}

_debug_sep() {
   _this_debug_sep=""
   _this_debug_indent=0 
   while [ "$_this_debug_indent" -lt "$debug_indent" ]; do
      _this_debug_sep="${debug_sep}${_this_debug_sep}"
      _this_debug_indent=$((_this_debug_indent+1))
   done
   printf "%s" "$_this_debug_sep"
   unset _this_debug_sep _this_debug_indent
}

push_indent_() { # $1=_sourcer
   _this_indent_inc=${#1}
   _this_indent_inc=$((_this_indent_inc + debug_indent_offset)) # #' ->'=3
   debug_indent=$((debug_indent + _this_indent_inc))
   unset _this_indent_inc
}

pop_indent_() { # $1=_sourcer
   _this_indent_inc=${#1}
   _this_indent_inc=$((_this_indent_inc + debug_indent_offset))
  # Avoid popping beyond empty
  if [ -z "$debug_indent" ] || [ "$((debug_indent - _this_indent_inc))" -le 0 ]; then
     debug_indent=0
  else
     debug_indent=$((debug_indent - _this_indent_inc))
  fi
  unset _this_indent_inc
}

source_with_debug() { # $1=_file, $2=_sourcer, $3=_sourced
   [ "$DEBUG_SHELL" = "1"  ] && echo "$(_debug_sep)$2$debug_connector$3"
   push_indent_ "$2"
   if [ ! -f "$1" ]; then
      rc=127
   elif . "$1"; then
      rc=0
   else
      rc=1
   fi
   [ "$DEBUG_SHELL" = "1" ] && echo "$(_debug_sep)$3$debug_connector$rc"
   pop_indent_ "$2"
   return "$rc"
}
