source "$LIBRARY_BASH/bash_colors.sh"

verbosePattern='V'
debugPattern='D'
errorPattern='E'
successPattern='S'
allPattern='^always$'

printMessage() {
   echo -e "${1}"
}

printVerboseMessage() {
   if [[ ($verbose == 1 && -n $1) ]]; then
      if PMSG_isColoredOutput $verbosePattern; then
         echo -e "${BBLUE}[INFO] ${1}${NC}"
      else
         echo -e "[INFO] ${1}"
      fi
   fi
}

printSuccessMessage() {
   if [[ -n $1 ]]; then
      if PMSG_isColoredOutput $successPattern; then
         echo -e "${BGREEN}${1}${NC}"
      else
         echo -e "${1}"
      fi
   fi
}

printDebugMessage() {
   if [[ $debug == 1 ]]; then
      if PMSG_isColoredOutput $debugPattern; then
         # [ ] Add colors ?
         echo -e "[DEBUG] ${1}"
      else
         echo -e "[DEBUG] ${1}"
      fi
   fi
}

printErrorMessageAndAsk() {
   if [[ -n $1 ]]; then
      if PMSG_isColoredOutput $errorPattern; then
         echo -e "${BRED}[ERROR] $1"

      else
         echo -e "[ERROR] $1"
      fi
   fi
   local answer="null"
   while [[ "$answer" != "y" && "$answer" != "n" && -n "$answer" ]]; do
      read -p "Continue? y/[n]: " answer
   done
   if PMSG_isColoredOutput $errorPattern; then
      echo -e "${NC}"
   fi

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

printErrorMessage() {
   if [[ -n $1 ]]; then
      if PMSG_isColoredOutput $errorPattern; then
         echo -e "${BRED}[ERROR] ${1}${NC}"
      else
         echo -e "[ERROR] ${1}"
      fi
   fi
}

PMSG_isColoredOutput(){
   [[ "$COLORS" =~ $1 || "$COLORS" =~ $allPattern || -z $COLORS ]]
   return $?
}
