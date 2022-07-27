source "$LIBRARY_BASH/bash_colors.sh"

printMessage() {
   echo -e "${1}"
}

printVerboseMessage() {
   if [[ $verbose == 1 && -n $1 ]]; then
      echo -e "${BBLUE}[INFO] ${1}${NC}"
   fi
}

printDebugMessage() {
   if [[ $debug == 1 ]]; then
      echo -e "[DEBUG] ${1}"
   fi
}

printErrorMessageAndAsk() {
   if [[ -n $1 ]]; then
      echo -e "${BRED}$1 ${NC}"
   fi
   local answer="null"
   while [[ "$answer" != "y" && "$answer" != "n" && -n "$answer" ]]; do
      read -p "Continue? y/[n]: " answer
   done

   if [[ -z $answer ]]; then
      answer=n
      printVerboseMessage "Selecting the 'n' option as default."
   fi
   case $answer in
   y)
      return 0
      ;;
   n)
      return 1
      ;;
   esac
}


printErrorMessageAndAsk() {
   if [[ -n $1 ]]; then
      echo -e "${BRED}$1 ${NC}"
   fi
   local answer="null"
   while [[ "$answer" != "y" && "$answer" != "n" && -n "$answer" ]]; do
      read -p "Continue? y/[n]: " answer
   done

   if [[ -z $answer ]]; then
      answer=n
      printVerboseMessage "Selecting the 'n' option as default."
   fi
   case $answer in
   y)
      return 0
      ;;
   n)
      return 1
      ;;
   esac
}
