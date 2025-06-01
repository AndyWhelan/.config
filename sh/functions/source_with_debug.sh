debug_separator_="    "
[ -z "$debug_indent_level" ] && debug_indent_level=0
debug_sep_() {
   local _sep=""
   local _i=0 
   while [ "$_i" -lt "$debug_indent_level" ]; do
      _sep="${debug_separator_}${_sep}"
      _i=$((_i+1))
   done
   printf "%s" "$_sep"
}

push_indent_() {
   debug_indent_level=$((debug_indent_level + 1))
}

pop_indent_() {
  # Avoid popping beyond empty
  if [ -z "$debug_indent_level" ] || [ "$debug_indent_level" -le 0 ]; then
     debug_indent_level=0
  else
     debug_indent_level=$((debug_indent_level - 1))
  fi
}

source_with_debug() {
   local _file=$1
   local _sourcer=$2
   local _sourcer_bare="${_sourcer#"!i->"}"
   _sourcer_bare="${_sourcer_bare#"i->"}"
   local _sourced=$3
   [ "$DEBUG_SHELL" = "1"  ] && echo "$(debug_sep_)${_sourcer_bare}->${_sourced}"
   push_indent_
   local _debug_str="$(debug_sep_)${_sourced}"
   if [ ! -f "$_file" ]; then
      [ "$DEBUG_SHELL" = "1" ] && echo "$_debug_str->2"
      pop_indent_
      return 2
   fi

   if . "$_file"; then
      [ "$DEBUG_SHELL" = "1" ] && echo "$_debug_str->0"
      pop_indent_
      return 0
   else
      [ "$DEBUG_SHELL" = "1" ] && echo "$_debug_str->1"
      pop_indent_
      return 1
   fi
}
