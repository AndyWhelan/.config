prompt_yes_no() {
   while true; do
      printf "%s (y/n) " "$1"
      if read -r answer; then
         case "$answer" in
            [Yy]*) return 0 ;;
            [Nn]*) return 1 ;;
            *) echo "Please answer y or n." ;;
         esac
      fi
   done
   return 0
}
