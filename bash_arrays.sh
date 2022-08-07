# see https://stackoverflow.com/a/8574392/15941363
containsElement() {
   local element match="$1"
   shift
   for element; do [[ "$element" == "$match" ]] && return 0; done
   return 1
}
