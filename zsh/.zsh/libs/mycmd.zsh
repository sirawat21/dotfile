#!/bin/zsh

# CUSTOM UTIL COMMANDS 
function mycmd() {
  case $1 in
    iso)
      echo "ISO Emulators"
      ;;
    help)
      echo "Usage: mycmd <command>"
      echo "Available commands:"
      echo "  greet <name>  - Greet the user"
      echo "  date          - Show today's date"
      echo "  list          - List files in the current directory"
      ;;
    *)
      echo "Unknown command: $1"
      echo "Type 'mycmd help' for usage."
      ;;
  esac
}
