_shell_flags=$-
if [ "$DEBUG_SHELL" = '1' ]; then
   _file=$1
   case _shell_flags in
       *i*) 
          echo "$(debug_sep_)${_file}->i?->Y"
          return 0 ;;
       *)
          echo "$(debug_sep_)${_file}->i?->N->1"
          return 1 ;;
   esac
else
   case _shell_flags in
       *i*) 
          return 0;;
       *)
          return 1 ;;
   esac
fi
