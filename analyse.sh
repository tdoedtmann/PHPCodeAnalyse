#!/bin/bash
function linesOfCode() {
  echo -e "\\033[0;1;32m+------------------------------------------------------------------------------+\\033[m"
  echo -e "\\033[0;1;32m| PHP LinesOfCode                                                              |\\033[m"
  echo -e "\\033[0;1;32m+------------------------------------------------------------------------------+\\033[m"
  phploc --count-tests $1
  echo ''
}
function copyPasteDetector() {
  echo -e "\\033[0;1;32m+------------------------------------------------------------------------------+\\033[m"
  echo -e "\\033[0;1;32m| PHP CopyPasteDetector                                                        |\\033[m"
  echo -e "\\033[0;1;32m+------------------------------------------------------------------------------+\\033[m"
  phpcpd $1
  echo ''
}
function deadCodeDetector() {
  echo -e "\\033[0;1;32m+------------------------------------------------------------------------------+\\033[m"
  echo -e "\\033[0;1;32m| PHP DeadCodeDetector                                                         |\\033[m"
  echo -e "\\033[0;1;32m+------------------------------------------------------------------------------+\\033[m"
  phpdcd $1
  echo ''
}
function codeSniffer() {
  echo -e "\\033[0;1;32m+------------------------------------------------------------------------------+\\033[m"
  echo -e "\\033[0;1;32m| PHP CodeSniffer                                                              |\\033[m"
  echo -e "\\033[0;1;32m+------------------------------------------------------------------------------+\\033[m"
  phpcs $1
  echo ''
}
function printUsage() {
  echo -e "\\033[0;0;32m+------------------------------------------------------------------------------+\\033[m"
  echo -e "\\033[0;0;32m| Command Line Interface for some Testing-Tools                                |\\033[m"
  echo -e "\\033[0;0;32m|                                           (copyright by Timo Strotmann 2010) |\\033[m"
  echo -e "\\033[0;0;32m|                                                                              |\\033[m"
  echo -e "\\033[0;0;32m| usage: phpTesting <option> <dir>                                             |\\033[m"
  echo -e "\\033[0;0;32m|                                                                              |\\033[m"
  echo -e "\\033[0;0;32m| Options:                                                                     |\\033[m"
  echo -e "\\033[0;0;32m|   -h, --help    - print this message                                         |\\033[m"
  echo -e "\\033[0;0;32m|   -a, --all     - execute all functions                                      |\\033[m"
  echo -e "\\033[0;0;32m|       --loc     - execute the phploc (PHP LinesOfCode)                       |\\033[m"
  echo -e "\\033[0;0;32m|       --cpd     - execute the phpcpd (PHP CopyPasteDetector)                 |\\033[m"
  echo -e "\\033[0;0;32m|       --dcd     - execute the phpdpd (PHP DeadCodeDetector)                  |\\033[m"
  echo -e "\\033[0;0;32m|       --cs      - execute the phpcs (PHP CodeSniffer)                        |\\033[m"
  echo -e "\\033[0;0;32m+------------------------------------------------------------------------------+\\033[m"
  echo ""
  exit 1
}

# check minimum argument count
if [ $# -lt 2 ]; then
	printUsage
fi

# parse argument list
while [ $# -ge 1 ]; do
	case $1 in
	help|--help|-h)
		printUsage
		;;

	all|--all|-a)
	  linesOfCode $2
	  copyPasteDetector $2
	  deadCodeDetector $2
	  codeSniffer $2
		;;

	loc|--loc)
	  linesOfCode $2
		;;

	all|--cpd)
	  copyPasteDetector $2
		;;

	all|--dcd)
	  deadCodeDetector $2
		;;

	all|--cs)
	  codeSniffer $2
		;;

  *)
    ;;

	esac
	shift
done