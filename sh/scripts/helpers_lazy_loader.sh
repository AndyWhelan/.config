# Stubs (lazy-loaded)

if [ -n "$HELPERS_LOADED" ]; then 
   return 0;
fi

FUNCTIONS_DIR="$HOME/.config/sh/functions"

# Check if function file exists for a given name
_load_function() { # TODO: not POSIX compliant because uses `local`
   local _func=$1
   local _file_basename=$2
   local _func_file="$FUNCTIONS_DIR/$_file_basename"
   if [ -f "$_func_file" ]; then # runtime safety check
      unset -f "$_func" # remove the stub so we can redefine
      . "$_func_file"   # load function definition
      return 0
   else
      echo "Cannot find $_func_file. Aborting lazy_loader." >&2
      return 127
   fi
}

# Create a stub function for each function file that lazy loads on first call
for f in "$FUNCTIONS_DIR"/*; do
   [ -f "$f" ] || continue # only [lazy]-load regular files
   stub_fname=$(basename "$f")
   func=${stub_fname%.sh}
   eval "$func() {
      _load_function \"$func\" \"$stub_fname\" || return 127
      $func \"\$@\"
   }"
done

HELPERS_LOADED=1
true
