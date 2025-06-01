record_history() {
   case $- in
      *i*) ;;
        *) return;;
   esac
   # Timestamp for filename
   # Only run once per shell session
   if [ -z "$HISTREC_STARTED" ]; then
      HISTREC_STARTED=1
      HISTREC_TS=$(date +%Y%m%d_%H%M%S)
      SHELL_VERSION_STR="shell"
      if [ -n "$BASH_VERSION" ]; then
         SHELL_VERSION_STR="${SHELL_VERSION_STR}_bash"
      elif [ -n "$ZSH_VERSION" ]; then
         SHELL_VERSION_STR="${SHELL_VERSION_STR}_zsh"
      else
         : # don't append. don't use any other shell yet, so ok for now
      fi
      HISTREC_FILE="$HOME/.config/shells/$SHELL_VERSION_STR.$HISTREC_TS.log"

      # Ask to start recording
      if prompt_yes_no "Start recording shell history to $HISTREC_FILE?"; then
         echo "Recording history..."

         # Bash setup
         if [ -n "$BASH_VERSION" ]; then
            # Append each command to file after execution
            PROMPT_COMMAND='history 1 >> '"$HISTREC_FILE"
            # On exit, notify user
            trap 'echo "Shell history saved to '"$HISTREC_FILE"'"' EXIT

         # Zsh setup
         elif [ -n "$ZSH_VERSION" ]; then
            # Set up zsh to append each command to the file after it runs This
            # uses the precmd hook that runs before prompt display (after
            # command runs)
            precmd_functions+=(record_history)
            record_history() {
               # Append last command from history to file
               fc -ln -1 >> "$HISTREC_FILE"
            }
            # On exit, notify user
            TRAPEXIT() {
               echo "Shell history saved to '$HISTREC_FILE'"
            }
         else
            echo "Unsupported shell for history recording."
         fi
      else
         echo "History recording not started."
      fi
   fi
}
